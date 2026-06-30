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

## Workflow Rule

The workflow should stay simple.

If a step does not add value, do not add it.
If a step is repeated often, make it explicit.
If a step becomes noisy, move it out of the stable layer.
