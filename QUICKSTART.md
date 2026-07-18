# Astra Quick Commands

**Use this file when you need fast guidance in another project. Copy-paste ready prompts and decision trees.**

---

## 🚀 Quick Situation Map

| Situation | Go to | Copy | Time |
|-----------|-------|------|------|
| I don't know where to start | [Q1: Path Decision](#path-decision-tree) | Quick prompt | 2 min |
| I need to frame this task | [Task Frame Template](#task-frame-template) | Template | 3 min |
| I'm handing work off to someone | [Handoff Checklist](#quick-handoff-checklist) | Checklist | 5 min |
| I found a useful reference | [Reference Analysis](#quick-reference-analysis) | Template | 5 min |
| I've finished and need to capture learnings | [Convergence](#quick-convergence) | Template | 5 min |
| I need to decide between options | [Decision Template](#quick-decision-template) | Template | 3 min |
| I'm unsure if this is reusable | [Reusability Check](#reusability-check) | Checklist | 2 min |
| I want to evaluate my design work | [Quality Dimensions](#quality-dimensions-quick-ref) | Reference | 2 min |
| I'm switching directions mid-task | [Path Switch Guide](#path-switch-signals) | Decision tree | 2 min |
| I need to apply a reference to my project | [Application Guide](#application-types) | Framework | 3 min |

---

## Path Decision Tree

**Ask in order. Stop at the answer.**

```
Q1: Is the goal clear?
├─ NO  → Q2
└─ YES → Q3

Q2: Do you need to explore broadly or narrowly?
├─ Broadly (many unknowns, competing directions)
│  └─ → EXPLORATORY PATH
└─ Narrowly (1-2 specific things to investigate)
   └─ → HYBRID PATH

Q3: Is the approach decided?
├─ NO (goal clear, but "how" is uncertain)
│  └─ → JUDGMENT PATH
└─ YES (both goal and approach known)
   └─ → EXECUTION PATH
```

**Then check:** Is this output reusable? → Weight convergence higher.  
**Then check:** Does someone else continue this? → Weight clarity higher.

---

## Task Frame Template

Copy this and fill in before starting:

```markdown
## Frame This Task

**What:** [One sentence: what are you trying to do?]

**Known:**
- [constraint/resource/requirement]
- [constraint/resource/requirement]

**Unknown:**
- [what you don't know yet]
- [what could change the approach]

**Path:** [Exploratory | Judgment | Execution | Hybrid]

**Why this path?**
- Goal clear? [yes/no]
- Approach decided? [yes/no]
- Need broad exploration? [yes/no]

**Success looks like:** [what done means]
```

---

## Quick Handoff Checklist

Use before handing off to another person or agent:

```
Clarity (recipient can understand without asking):
☐ The goal is written in one clear sentence
☐ What is known and what is uncertain is explicit
☐ The path choice is explained
☐ Next steps are unambiguous
☐ No jargon without definitions

Completeness:
☐ Links to relevant source material
☐ Key constraints are listed
☐ Dependencies are named
☐ Assumptions are surfaced (not hidden)
☐ What NOT to do is as clear as what to do

Refinement:
☐ Working material is separated from stable content
☐ The handoff file has been read by the recipient once
☐ Questions have been answered
☐ Feedback has been incorporated

Ready to hand off? All ☑ before proceeding.
```

---

## Quick Reference Analysis

Use when you find a useful article, pattern, or example to analyze:

```markdown
## Reference Analysis

**Source:** [title, URL, author]

**Position:** [1 sentence: why this matters to your work]

**Structure:** [How is this organized? What are the main sections?]

**Key Decisions:** 
- Decision 1: [what choice did they make? why?]
- Decision 2: [what choice did they make? why?]

**Language/Phrases:** [What words or framings are useful here?]

**Can I use this?**
- Direct (copy as-is)? [yes/no] Why?
- Adapt (modify and apply)? [yes/no] How?
- Reject (not relevant)? [yes/no] Why?

**Reusable insight for Astra?** [yes/no] What is it?
```

---

## Quick Decision Template

Use when you need to choose between options:

```markdown
## Decision

**Question:** [What are you deciding?]

**Options:**
1. [Option A]
   - Pros: [benefit, benefit]
   - Cons: [cost, cost]
   
2. [Option B]
   - Pros: [benefit, benefit]
   - Cons: [cost, cost]

**Decision Criteria:**
- [What matters most? Why?]
- [What's the next highest priority?]

**Choice:** [Option A | Option B | Hybrid | Neither—explore more]

**Why:** [1-2 sentences explaining the reasoning]

**If wrong:** [What would tell us this was the wrong choice?]
```

---

## Quick Convergence

Run this after a task finishes to capture reusable learnings:

```markdown
## Convergence

**Task Summary:** [What did you build/decide/discover?]

**What Worked:**
- [approach, pattern, or decision that was effective]
- [approach, pattern, or decision that was effective]

**What Did Not Work:**
- [assumption that was wrong]
- [approach that did not fit]

**Reusable Insight:**
[1-2 sentences: what should future work remember from this?]

**Confidence:** [Low | Medium | High]

**Belongs in:**
- ☐ Astra (cross-project value)
- ☐ Project only (not general)
- ☐ Memory layer (repeated pattern)
- ☐ Archive (historical value only)

**Action:** [Add | Revise | Ignore | Archive]
```

---

## Quality Dimensions Quick Ref

Use when you want to evaluate if your work feels right:

| Dimension | Ask | Primary For |
|-----------|-----|-------------|
| **Clarity** | Is the next step obvious? | Handoffs, specs, execution |
| **Refinement** | Are details intentional? | Reusable output, patterns |
| **Responsiveness** | Is causality clear? (I did X, Y happened) | Workflows, interaction design |
| **Composability** | Do pieces fit without friction? | Patterns, templates, systems |
| **Generativity** | Did we explore broadly before converging? | Discovery, reference analysis |
| **Criticality** | What are we questioning? What assumptions are hidden? | Judgment, standards, decisions |

**Use pattern guidance:** Check `patterns.md` to see which dimensions are primary for your path (Exploratory/Judgment/Execution/Hybrid).

---

## Path Switch Signals

**Stuck in Exploratory?**  
Switch to Judgment when:
- The problem definition has stabilized
- You have enough information to decide
- Further exploration has diminishing returns

**Stuck in Judgment?**  
Switch to Execution when:
- The decision is sufficiently clear
- Tradeoffs are understood
- You are ready to build

**Stuck in Execution?**  
Switch back to Exploratory when:
- A hidden constraint appears
- The core assumption is wrong
- The direction is not viable

**Mixed clear/unclear?**  
Stay in Hybrid and scope exploration to one thing.

---

## Reusability Check

Ask these to decide if something belongs in Astra:

```
Will this still matter in 6 months? [yes/no]
  └─ no → keep in project only

Can you use this in another project? [yes/no]
  └─ no → keep in project only

Is this a rule, pattern, or preference? [rule/pattern/pref/noise]
  └─ noise → ignore

Can you explain this in one or two sentences? [yes/no]
  └─ no → break it down further

Does Astra already have something close? [yes/no]
  └─ yes → revise existing, don't add new
```

**If all ✓ → Consider converging to Astra**

---

## Application Types

When you're applying a reference insight to your project, choose one:

**Direct Application**
- Copy the pattern or solution exactly
- Use when: It fits your constraints perfectly; no modification needed
- Risk: May not fit your specific context
- Example: Use a UI component exactly as published

**Adapted Application**
- Modify the insight to fit your constraints
- Use when: The core idea is right, but details need adjustment
- Risk: May diverge from the original intent
- Example: Adapt a workflow for your team size

**Rejected Application**
- The insight does not apply to your project
- Use when: Constraints or context are fundamentally different
- Risk: May miss a useful pattern
- Example: A design pattern for desktop does not work on mobile

**Document your choice:** Record which type you chose and why in your project notes.

---

## Copy-Paste Prompt for Claude Code

Use this when starting work in another project and need to load Astra context:

```
Load these Astra foundation files:
- /path/to/astra/README.md
- /path/to/astra/standards.md
- /path/to/astra/patterns.md
- /path/to/astra/workflow.md
- /path/to/astra/protocols/path-selection-protocol.md

Task: [your task here]

Before starting:
1. Use the path-selection-protocol to choose Exploratory/Judgment/Execution/Hybrid
2. Fill the task-frame-template from QUICKSTART.md
3. Reference quality dimensions relevant to my path
4. After finishing, run convergence to capture reusable learnings
```

---

## Common Mistakes & Fixes

| Mistake | Signal | Fix |
|---------|--------|-----|
| Skip exploration when needed | "I think I know..." but haven't validated | Do a short exploratory pass |
| Over-explore when clear | Keep investigating after core Q is answered | Move to judgment/execution |
| Treat execution like judgment | Building, then discovering wrong direction | Validate goal + approach before building |
| Treat judgment like exploration | Endlessly comparing options | Set decision criteria first |
| Converge too much noise | Astra grows with one-off details | Ask: Will this matter in 6 months? |
| Never converge learnings | Astra stays static; knowledge is lost | Run convergence after each task |
| Forget to check reusability | Add project-specific noise to Astra | Use reusability check first |

---

## When You're Stuck

**Choose a question. Answer it honestly. Pick an action.**

1. **"What is actually uncertain?"**
   - The goal → Exploratory path
   - The approach → Judgment or Hybrid
   - The implementation → Execution path

2. **"What would change my mind?"**
   - Need more information? → Keep exploring
   - Need to choose? → Move to judgment
   - Need to build? → Move to execution

3. **"Do I have enough context?"**
   - No → Stay in current path; continue
   - Yes but unclear which direction → Judgment path
   - Yes and know the direction → Execution path

4. **Default: Start with Hybrid** if genuinely unsure.

---

## File Locations

Save this in your Astra clone:

```
/Users/your-name/astra/QUICKSTART.md  ← This file
```

Link from your local agent config:

```
Astra Quick: /Users/your-name/astra/QUICKSTART.md
```

Or from any project:

```
Load /path/to/astra/QUICKSTART.md first
Then: /path/to/astra/README.md for full context
```

