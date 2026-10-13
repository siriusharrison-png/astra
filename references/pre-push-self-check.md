# Pre-Push Self-Check

Agent behavior protocol: before pushing to a remote, reproduce the project's
CI gates locally and push only when they pass. This exists because the common
failure mode is "PR build goes red on a check that CI runs but the local
pre-commit/pre-push hooks don't" — e.g. a type error, a stale generated file,
or an i18n manifest that was never regenerated.

This is a protocol the agent follows, not an installed git hook. It is
cross-project and applies to every local repo, with no change to global git
config.

## When It Applies

Run this before every `git push` the agent performs on the user's behalf —
whether pushing a new branch, updating an existing PR branch, or pushing to
any remote. Skip only when the user explicitly says to push without checks.

## The Protocol

1. **Identify what CI actually runs.** Do not guess. Read, in order of
   authority:
   - CI config: `.github/workflows/*.yml` (jobs + the commands they run),
     or `.gitlab-ci.yml`, `vercel.json`, etc.
   - `package.json` scripts (or `Makefile` / `pyproject.toml` / language
     equivalent) for the real command behind each CI step.
   - Existing git hooks (`.husky/`, `core.hooksPath`, `.git/hooks/`) — note
     what they already cover so you don't duplicate, and what they miss.
   The output of this step is a concrete list of gate → local command.

2. **Run the local equivalents.** For each gate reproducible locally, run its
   command and read the result. Typical set: typecheck (`tsc --noEmit`), lint
   (`eslint` / `ruff`), build, unit tests, and project-specific generators or
   validators (i18n scan/check, codegen, schema sync). Run the project's own
   command — the one CI uses — not a generic substitute.

3. **Green-only push.** If any gate fails, stop and fix it before pushing;
   do not push a known-red branch. If a fix regenerates committed artifacts
   (generated messages, lockfiles, snapshots), stage and commit them too, then
   re-run the affected gate.

4. **Mark what can't run locally.** Some gates are environment-bound (Vercel
   deploy, preview comments, secret-dependent integration tests). Note these
   as "can't reproduce locally — will verify on CI" rather than claiming they
   passed. After pushing, watch the real CI status for them.

## Fallback (no CI config)

When a repo has no discoverable CI config, degrade to the generic gate set and
run whichever exist: build, typecheck, lint, test. Prefer the project's own
scripts over invented commands; if none exist, say so rather than inventing a
check.

## Principles

- **CI is the source of truth, not the agent's memory.** The checks that
  matter are the ones this project's CI runs today — re-read them per project,
  per push, because they drift.
- **Honesty over green.** Report what was run, what passed, what was skipped
  and why. A skipped environment-bound gate is fine to state; a fabricated
  pass is not.
- **Compose with existing hooks, don't fight them.** If a pre-commit/pre-push
  hook already runs a gate, let it; this protocol fills the gaps CI exposes.
