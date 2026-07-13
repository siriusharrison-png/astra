# Convergence

## Purpose

Convergence is the action of turning task discussion into reusable Astra updates.

It happens after a task or major discussion finishes, when there is enough context to decide what should be kept, refined, or discarded.

## Why It Exists

Astra should improve over time.
If every task leaves behind useful lessons, future work becomes faster, clearer, and more consistent.

Without convergence, Astra becomes static.
Without discipline, Astra becomes noisy.
The durable record of convergence lives in `CHANGELOG.md`.

## Agent Instruction

When an agent finishes a task and has enough context to review what happened, it should run a convergence pass.

Convergence is part of the working loop, not an optional cleanup step.

The agent should:

- review the task outcome
- extract reusable insights
- separate stable ideas from temporary ones
- update the smallest relevant layer
- keep the update in English first

## What Convergence Does

Convergence performs four actions:

1. extract reusable information
2. classify the information by layer
3. decide whether to promote, revise, or ignore it
4. write the update in English first

## What Can Be Captured

Good convergence candidates include:

- repeated preferences
- clearer wording
- path-selection signals
- useful tradeoff framing
- rules that proved helpful in the task
- template improvements
- boundary clarifications
- phrasing that reduces ambiguity
- reusable decision shortcuts
- task patterns that appeared more than once

## What Should Not Be Captured

Do not capture:

- one-off project noise
- unstable business details
- raw brainstorming that has no future value
- content that belongs only to a single task
- anything that would weaken the stable layer
- anything already obvious from the current files

## Convergence Layers

### Stable Layer

Use this only when the new rule changes Astra itself in a durable way.

### Evolving Layer

Use this for recurring lessons, preferences, and reusable judgment patterns.

Examples:

- "Use the judgment path when the goal is already framed."
- "Keep templates short enough to reuse quickly."
- "Write updates in English first."

### Working Layer

Use this for task-specific drafts, notes, and temporary material.

Examples:

- active discussion notes
- draft decisions
- temporary task checklist
- one-off spec text

### Archive Layer

Use this for retired or deprecated material that still has historical value.

## Convergence Questions

Before writing an update, ask:

1. Will this still matter in future work?
2. Is this a rule, a pattern, a preference, or just temporary context?
3. Does it belong in the stable layer or the evolving layer?
4. Can this be written more clearly in English?
5. Does it improve Astra, or just add volume?

## Convergence Workflow

### Step 1: Collect

At the end of a task, collect the useful points from the discussion.

### Step 2: Classify

Assign each candidate to one of these:

- stable
- evolving
- working
- archive
- ignore

### Step 3: Compress

Rewrite the idea in a short, reusable form.
Avoid long task-specific narration.

Prefer one to three sentences.
Prefer direct statements over commentary.
Prefer rule-like language over storytelling.

### Step 4: Confirm

If the update changes the stable layer, confirm before writing.
If the update only improves the evolving layer, it can usually be added directly.

### Step 5: Write

Update the right file with the smallest useful change.
If the change is reusable and worth tracking, append it to `CHANGELOG.md`.

### Step 6: Record

If the update belongs to the evolving layer and represents a cross-project pattern worth retaining, consider adding it to `memory.md` as well.

The evolving layer lives in specific files (standards.md, patterns.md, workflow.md, templates.md, convergence.md).
The memory layer provides a central place to store recurring preferences and patterns in chronological order.

Not all evolving layer updates belong in memory—only those that represent validated preferences or judgment patterns that will genuinely appear in future work.

## Convergence Output Shape

For each candidate, the output should usually include:

- source: where the insight came from
- layer: stable, evolving, working, archive, or ignore
- summary: the reusable rule in one or two sentences
- action: add, revise, move, archive, or ignore

Optional fields:

- rationale: why this belongs in that layer
- confidence: low, medium, or high
- file: target file path

## Convergence Rule

Convergence is successful when the foundation becomes:

- clearer
- smaller
- more reusable
- easier for future agents to load

It is not successful when it only becomes longer.
It is also not successful when the lesson is only remembered in conversation and never recorded.

## Promotion Rules

- Promote to stable only when the rule is broadly true and unlikely to change
- Promote to evolving when the insight repeats and improves future work
- Keep in working when the content is only useful for the current task
- Archive when the material is no longer active but still worth preserving
- Ignore when the idea does not improve Astra

## Anti-Patterns

- dumping raw meeting notes into memory
- promoting a one-off preference into a global rule
- adding templates before the structure is settled
- changing stable definitions without confirmation
- writing long explanations when a short rule is enough
