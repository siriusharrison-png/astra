# Workflow

## Purpose

This file defines how Astra should be used during a task.

It connects path selection, execution, and convergence.

## Working Loop

For each task, follow this loop:

1. frame the task
2. choose a path
3. work the task
4. review the result
5. run convergence
6. update Astra if needed

When the task includes reference analysis, insert application before convergence:

1. analyze the reference
2. identify reusable insight
3. apply it to the target project
4. converge reusable lessons back into Astra only when they are general enough

## Step 1: Frame the Task

Before doing anything, identify:

- what the task is
- what is already known
- what is still uncertain
- whether the task is exploratory, judgment-based, execution-based, or hybrid

## Step 2: Choose a Path

Choose the lightest useful path:

- Exploratory Path when the problem needs discovery
- Judgment Path when the question is mostly about choosing
- Execution Path when the direction is already known
- Hybrid Path when the task has both known and unknown parts

## Step 3: Work the Task

During execution:

- stay inside the chosen path as long as it fits
- switch paths when the task shape changes
- keep the language English first
- prefer reusable output over verbose explanation
- keep working material separate from stable content

## Temporary Code Discipline

When a task needs throwaway scaffolding to verify a flow — a mock, a hardcoded return, a demo seed, a feature switch — treat it as radioactive: useful up close, forbidden in the shipped artifact.

- **Never commit temporary verification code.** Remove it before commit, not just disable it. If a switch must stay, its default must be the safe/production value so an accidental commit cannot change runtime behavior.
- **Make it findable and self-destructing.** Tag every temporary block with a unique, greppable marker (e.g. `MOCK-DO-NOT-COMMIT`) and grep for the marker as a pre-commit self-check.
- **Every unresolved integration point gets an accurate marker.** Anything awaiting a real API, a backend contract, or a later replacement must carry a precise `TODO` / `MOCK` note stating the root cause and the exact alignment needed — not a vague "fix later." A leftover marker is a real statement, not filler; keep it truthful.
- **Escalate the markers into the PR.** The PR description must call out every pending-integration and mock-replacement item explicitly so reviewers and backend can act on it; do not rely on in-code comments alone.

## Step 4: Review the Result

After the main task is done, review:

- what worked
- what did not work
- what was learned
- what repeated across the discussion
- whether anything should be promoted, revised, archived, or ignored

## Step 5: Run Convergence

Trigger convergence when:

- the task is complete
- there is enough context to decide what matters
- the discussion produced a reusable lesson

Do not run convergence too early.
Do not wait so long that the lesson gets lost.

If the update is reusable, append it to `CHANGELOG.md` as part of the convergence step.

If the lesson belongs to the target project only, keep it there and do not write it back into Astra.

## Step 6: Update Astra

Update only the files that truly need it.

Use this rule:

- stable change -> confirm first
- evolving change -> add if reusable
- working change -> write directly if task-specific
- archive change -> preserve history
- ignore -> do not write

## Task End Check

Before closing a task, check:

- Is the conclusion clear?
- Did we capture reusable value?
- Did we avoid polluting the stable layer?
- Did we keep the update in English first?
- Did we write the smallest useful change?

## When to Reuse This Workflow

Use this workflow whenever a task involves:

- design discussion
- spec drafting
- pattern refinement
- cross-project judgment
- repeated preference capture
- any work that should improve Astra afterward
- live reference analysis
- extracting useful patterns from online pages or samples

## Workflow Rule

The workflow should stay simple.

If a step does not add value, do not add it.
If a step is repeated often, make it explicit.
If a step becomes noisy, move it out of the stable layer.

---

## Context Weighting

Use these dimensions to adjust how heavily each path is weighted for your specific task.
They do not change the paths themselves; they help choose which path to emphasize and when to transition between paths.

### Output Scope Weight

**One-off output?** → Weight execution heavier. Move faster toward delivery. Less convergence needed.

**Reusable output?** → Weight exploration heavier. Invest in clarity and structure. Plan for convergence.

**Unclear scope?** → Start with hybrid, let the task reveal what it needs.

---

### Cross-Project Relevance Weight

**Astra-relevant discovery?** → Weight convergence heavily. This insight belongs in CHANGELOG.

**Project-specific only?** → Keep in working layer. No Astra update needed. Execution or judgment path is usually enough.

**Mixed (some reusable, some specific)?** → Hybrid path, converge only the general part.

---

### Handoff Weight

**Next step is another agent/person?** → Weight clarity heavily. Invest in explicit explanation. Use patterns to scaffold understanding.

**Next step is direct execution by you?** → Weight completeness over explanation. Execution path is often enough.

**Next step is uncertain?** → Stay exploratory longer. Do not hand off half-formed decisions.

---

### Stability Weight

**Stable decision?** → Safe to move into judgment or execution. The path is clear.

**Uncertain territory?** → Extend exploration. Try small examples. Gather evidence before committing to a path.

**Revisit scenario?** → When you discover a constraint mid-execution, switch back to exploratory temporarily. Reweight before continuing.

---

### Convergence Timing Weight

**High reuse probability?** → Converge immediately after review. Capture the insight while fresh.

**Medium reuse probability?** → Mark for next convergence pass. Collect several lessons together.

**Low reuse probability or project-specific?** → Do not converge. Archive in the project, not in Astra.
