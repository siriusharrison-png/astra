# Path Selection Protocol

## Purpose

This protocol helps you choose which of the 4 working paths (Exploratory, Judgment, Execution, Hybrid) is right for your current task.

Use this when you are framing a task and uncertain about which path to follow.

---

## When to Use This Protocol

You are starting a task and need to decide:
- How much exploration is actually useful?
- Should I move directly to decision-making?
- Is this task clear enough to execute, or do I need to investigate first?

---

## The 4 Paths

### Exploratory Path

**Use when:** The problem space is unclear, the solution direction is not obvious, or you need to gather information before deciding.

**Signals:**
- Vague or competing briefs
- Multiple possible directions
- "I don't know where to start"
- Ambiguous user needs or interaction patterns
- Workflow or information architecture questions

**Cost:** Time-intensive upfront investigation

**Benefit:** Reduced risk of building the wrong thing

**Duration:** Weeks to months, depending on complexity

---

### Judgment Path

**Use when:** The goal is already clear and you mostly need to choose between options or make tradeoffs.

**Signals:**
- Clear goal, unclear best approach
- Multiple viable directions to evaluate
- "How should I do this?" rather than "What should I do?"
- Decision requires weighing tradeoffs
- Established context but new execution method

**Cost:** Decision fatigue; you are responsible for choosing

**Benefit:** Faster than exploration; relies on known constraints

**Duration:** Days to weeks

---

### Execution Path

**Use when:** The direction is already known. Your job is to produce the output.

**Signals:**
- Goal is clear
- Approach is decided
- Constraints are mapped
- "Here is what to build"
- Technical implementation or detailed specification work

**Cost:** Can miss hidden problems if framing was wrong

**Benefit:** Direct to deliverable; no ambiguity

**Duration:** Hours to days

---

### Hybrid Path

**Use when:** Part of the task is clear and part is not. You need a short exploration loop before moving to judgment or execution.

**Signals:**
- Goal is clear but approach is uncertain
- Some constraints are known; others need discovery
- "Let me research this one thing, then decide"
- Mixed known and unknown elements

**Cost:** Moderate; exploration is scoped and time-bounded

**Benefit:** Reduces risk without full exploration

**Duration:** Days to weeks

---

## Decision Framework

Answer these questions in order:

### 1. Is the goal clear?

**No** → Move to Question 2 (likely Exploratory)

**Yes** → Move to Question 3

---

### 2. Do you need to explore broadly, or can you narrow the search?

**Broadly** (many unknowns, competing directions) → **Exploratory Path**

**Narrowly** (one or two specific things to investigate) → **Hybrid Path**

---

### 3. Is the approach decided?

**No** (goal is clear but "how" is uncertain) → **Judgment Path**

**Yes** (both goal and approach are known) → Move to Question 4

---

### 4. Are all constraints and dependencies mapped?

**No** → **Execution Path** (but flag the missing constraint)

**Yes** → **Execution Path**

---

## Context Weighting

Once you've chosen a path, check these dimensions to adjust your emphasis within that path:

**Output Scope Weight:** Is this one-off or reusable? (Reusable → invest more in clarity and structure)

**Cross-Project Relevance:** Does this belong in Astra later? (Yes → plan for convergence)

**Handoff Weight:** Is someone else continuing this? (Yes → prioritize clarity)

**Stability Weight:** How confident are you? (Low → extend exploration)

**Convergence Timing:** Will this be reusable? (Yes → capture it immediately after)

See `workflow.md` Context Weighting section for full details.

---

## Path Switch Signals

You chose one path, but conditions changed. Switch when:

**Switch from Exploratory → Judgment**
- The problem definition has stabilized
- You have enough information to decide
- Further exploration has diminishing returns

**Switch from Judgment → Execution**
- The decision is sufficiently clear
- Tradeoffs are understood
- You are ready to build

**Switch from Execution → Exploratory**
- A hidden constraint or dependency appears
- The assumption underlying execution is wrong
- You discover the direction is not viable

**Switch to Hybrid**
- A clear task reveals one ambiguous element
- You can scope exploration to a small loop

---

## Common Mistakes

### Skipping Exploration When It's Needed
- Risk: Building the wrong thing confidently
- Signal: "I think I know what to do" but haven't validated with users or reality
- Fix: Do a short exploratory pass; do not skip it

### Over-Exploring When Direction Is Clear
- Risk: Analysis paralysis; diminishing returns on investigation
- Signal: "I have answered the core question but keep investigating"
- Fix: Move to judgment or execution; revisit only if execution reveals gaps

### Treating Execution Like Judgment
- Risk: Pausing mid-build to reconsider direction
- Signal: Building, then discovering you are building the wrong thing
- Fix: Before execution, validate that goal and approach are actually decided

### Treating Judgment Like Exploration
- Risk: Endlessly comparing options without deciding
- Signal: "I could do A or B or C..." with no decision criteria
- Fix: Set decision criteria first; then judge against them

---

## When You're Still Uncertain

If you cannot confidently choose a path:

1. **Ask: "What is most uncertain?"**
   - If the goal → Exploratory
   - If the approach → Judgment or Hybrid
   - If the implementation → Execution

2. **Ask: "What would change my mind?"**
   - Need more information? → Exploratory
   - Need to evaluate options? → Judgment
   - Need to see it built? → Execution

3. **Default to Hybrid:** If genuinely unsure, start with a bounded exploration loop, then re-assess.

---

## Integration with Astra

This protocol is part of your **working loop** (workflow.md Step 2).

After choosing a path:
- Reference `patterns.md` to see which quality dimensions are primary for your path
- Load relevant templates from `templates.md` 
- Use the path throughout the task
- After the task, capture reusable lessons in convergence
