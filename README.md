# Astra

## Definition

Astra is a local, cross-project, agent-loadable foundation for spec work, norms, memory, and reusable working patterns.

It is not a feature product.
It does not provide end-user capabilities.
It does not belong to one specific project.

Its job is to collect the rules, structures, language, and decision logic that you keep reusing across projects, so Codex and Claude Code can work from the same base.

One-line definition:

> Astra is a local operating base for spec-driven work, designed to keep repeated design and engineering thinking consistent across tools, projects, and sessions.

## Usage Model

Astra is intended to be used as a local repository that is synchronized from a remote source of truth.

The normal flow is:

1. keep Astra in its own git repository
2. clone it locally on each machine that needs it
3. point your agent configuration at the local clone
4. sync before work starts
5. run convergence after a task finishes
6. record reusable changes in `CHANGELOG.md`

This means other people do not use your remote copy directly at runtime.
They need a local copy or local clone on their machine, because their agent loads files from the local filesystem.

If the source repository is updated, users should sync first so they always work from the latest version.

Recommended automation:

- run `bash scripts/sync.sh` before a session
- run `bash scripts/converge.sh` after a task
- wire the sync command into shell startup or your launch command if you want it to happen automatically

Quickstart:

```bash
git clone <astra-repo-url> ~/astra
cd ~/astra
bash scripts/sync.sh
```

If you want a single entry command for initial setup:

```bash
bash scripts/bootstrap.sh --repo <astra-repo-url> --target ~/astra
```

After that, point your agent config to the local clone path and start working.

## Distribution Rule

- Developers maintain the canonical Astra repository
- Consumers keep a local clone
- Local agent configs load the local clone path
- Updates flow through git, not by copying individual files by hand

## Agent Connection Example

Point your local agent config to the Astra clone path.

For example:

```text
Astra path: /Users/your-name/astra/README.md
```

Load the core files when the task is cross-project or spec-driven:

```text
/Users/your-name/astra/README.md
/Users/your-name/astra/principles.md
/Users/your-name/astra/standards.md
/Users/your-name/astra/patterns.md
/Users/your-name/astra/workflow.md
/Users/your-name/astra/memory.md
/Users/your-name/astra/convergence.md
/Users/your-name/astra/templates.md
```

## Quickstart

```bash
git clone <astra-repo-url> ~/astra
cd ~/astra
bash scripts/sync.sh
```

If you want a single setup command:

```bash
bash scripts/bootstrap.sh --repo <astra-repo-url> --target ~/astra
```

After that, point your agent config to the local clone path and start work.

## Core Position

- `Spec base`: turn discussion into structured specs
- `Norm base`: store stable rules, boundaries, and conventions
- `Memory base`: retain reusable cross-project knowledge
- `Prompt base`: keep different agents aligned on the same working language

## Core Method

Astra does not force one universal process.
It selects a working path based on the task type.

The default question is not "what is the one correct process?"
The default question is:

1. Does this task need exploration?
2. If yes, how much exploration is actually useful?
3. If no, can we move directly to judgment or execution?

## Path Selection

### 1. Exploratory Path

Use this when the problem is unclear, the solution space is wide, or the experience itself needs investigation.

Typical signals:

- vague brief
- competing directions
- product or interaction ambiguity
- information architecture questions
- workflow redesign
- multi-step experience design

Goal:

- expand the problem space
- uncover constraints
- compare directions
- reduce uncertainty before committing

### 2. Judgment Path

Use this when the goal is already clear and the task is mostly about choosing or confirming the right answer.

Typical signals:

- logic discussion
- rule confirmation
- target already defined
- small decision point
- one missing piece in an otherwise clear structure

Goal:

- align on the decision criteria
- evaluate tradeoffs
- choose the best direction quickly

### 3. Execution Path

Use this when the direction is already known and the job is to turn it into a spec, standard, checklist, or implementation-ready output.

Typical signals:

- approved direction
- existing solution
- clear target state
- documentation task
- conversion from discussion to action

Goal:

- make the output precise
- reduce ambiguity
- translate intent into something executable

### 4. Hybrid Path

Use this for most real tasks.

Start with a small exploration loop, then move quickly into judgment and execution.

This is the most common pattern when:

- the problem is partly clear, partly uncertain
- the task has known constraints but unknown details
- you need enough exploration to avoid shallow answers, but not enough to waste time

## What Astra Is Not

- not a project-specific knowledge dump
- not a feature backlog
- not a one-off design brief archive
- not a replacement for the actual codebase
- not a place for unstable business details that belong elsewhere

## Content Principles

- keep only information with cross-project value
- write stable rules, not temporary conclusions
- separate universal language from project-specific detail
- define structure before adding examples
- define boundaries before adding templates
- use English as the first language for all content, iterations, and updates
- keep the stable layer small and deliberate
- use the evolving layer for lessons that repeat
- use the working layer for active task material only

## Structure Principles

Astra should be organized into layers.

### 1. Stable Layer

The most conservative layer.
This layer defines what Astra is and how it should be used.

Good contents:

- definition
- core methods
- global principles
- naming conventions
- path selection rules
- write/read boundaries

### 2. Evolving Layer

The layer that improves over time.
This layer makes Astra more accurate and more "you".

Good contents:

- repeated preferences
- validated decisions
- recurring feedback
- task retrospectives
- reusable judgment patterns
- path selection observations
- phrase patterns that reduce ambiguity
- recurring tradeoffs that matter across projects

### 3. Working Layer

The task layer.
This layer can change frequently and does not need to stay permanent.

Good contents:

- spec drafts
- discussion notes
- temporary checklists
- working hypotheses
- one-off decision trails

### 4. Archive Layer

Completed or inactive material that still has historical value.

Good contents:

- retired drafts
- resolved debates
- old spec versions
- deprecated templates

## Update Policy

- Stable Layer should change rarely and deliberately
- Evolving Layer can be updated after each task if the lesson is reusable
- Working Layer can be rewritten freely
- Archive Layer should preserve history, not shape daily behavior
- All new iterations should be written in English first; other languages can be added only as secondary support
- If a change belongs to more than one layer, keep the stable rule in the higher layer and the project-specific detail in the lower layer
- If a lesson is not reusable, do not promote it to the evolving layer

## Recommended File Model

- `README.md`: Astra definition and entry point
- `principles.md`: long-lived principles
- `standards.md`: stable conventions and rules
- `patterns.md`: reusable thought and output patterns
- `workflow.md`: task flow and convergence trigger rules
- `memory.md`: evolving cross-project knowledge
- `convergence.md`: rules for turning task discussion into reusable updates
- `templates.md`: structured templates for specs and reviews
- `convergence-template.md`: copyable end-of-task convergence format
- `CHANGELOG.md`: append-only record of reusable updates
- `scripts/sync.sh`: fetch and pull the latest repo version
- `scripts/converge.sh`: append convergence records to the changelog
- `scripts/bootstrap.sh`: clone or sync a local Astra copy
- `INSTALL.md`: installation and agent connection guide
- `specs/`: task drafts and active working docs
- `archive/`: completed or deprecated material

## Why This Exists

The goal is not to create more content.
The goal is to reduce repeated explanation.

Astra exists to:

- keep the same working language across tools
- make repeated design and engineering judgment easier to reuse
- shorten the time between discussion and execution
- help future agents understand the project context faster

## Design Thinking Model

Astra supports design thinking, but it does not force a single linear process.

When the task is exploratory, it can behave like a double-diamond flow:

- discover the problem
- define the target
- develop options
- deliver a concrete outcome

When the task is already clear, it should skip unnecessary exploration and move directly to judgment or execution.

The key rule is simple:

> Use the lightest process that still produces a correct and useful outcome.

## Path Transition Rules

Astra should be able to move between paths when the task changes.

Examples:

- exploratory -> judgment when enough context has been gathered
- judgment -> execution when the choice is clear
- execution -> exploratory when a hidden constraint appears
- hybrid -> exploratory when the task turns out to be larger than expected

## Working Contract

When Astra is used by an agent, the agent should:

- read the definition first
- choose a path before writing
- keep the language English first
- prefer reusable output over one-off prose
- separate stable rules from working material

## Convergence Principle

After each task, Astra should capture reusable insights from the discussion and decide whether they belong in the stable layer, the evolving layer, a template, or the archive.

This is not an automatic save.
It is a deliberate review action.

The goal is to make the foundation more accurate over time without turning it into a pile of noise.

## Template Strategy

Templates should come after structure.

Do not start with examples or reference material.

Order of work:

1. define the structure
2. define the names
3. define the update rules
4. define the path rules
5. add templates
6. add examples
7. add reference material

This avoids building a pile of content without a stable system underneath it.

## Current Priority

The current priority is not breadth.
It is clarity, structure, and reuse.

Templates and examples should be added only after the core structure feels stable and easy to load.

## Final Goal

Astra should help you do four things consistently:

- think more clearly
- express decisions more precisely
- turn discussion into execution faster
- let future agents understand your working style with less friction
