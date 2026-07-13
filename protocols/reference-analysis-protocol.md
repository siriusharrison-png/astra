# Reference Analysis Protocol

## Purpose

This protocol structures how to analyze a live reference (design, article, pattern, or example) and extract insights that might be transferable to your work or to Astra.

Use this when you need to learn from external examples without copying them directly.

---

## Scope

This protocol works with:
- Design examples (websites, apps, interfaces)
- Articles or frameworks (methodology, thinking)
- Patterns or systems (component libraries, design systems)
- Competitor or adjacent work (how others approach a problem)
- Academic or industry references (research, best practices)

Reference `standards.md` for quality dimension definitions.

---

## Analysis Framework

### Phase 1: Positioning (Clarify Intent)

**Questions to ask:**

- What is this work trying to do? (Goal, not medium)
- Who is it for?
- What problem does it solve?
- What is the context it was made in?

**Document:**
- 2-3 sentence summary of the intent
- The gap or need it addresses
- The constraints it was working within (if visible)

**Dimension:** Clarity — Your own understanding must be clear first.

---

### Phase 2: Structure (Understand the Approach)

**Questions to ask:**

- How is the work organized?
- What are the main pieces?
- How do they fit together?
- What principle seems to hold it together?

**Document:**
- The organizational logic
- Main components or phases
- How parts relate to each other
- Any hierarchy or prioritization

**Dimension:** Composability — You are looking for modular thinking.

---

### Phase 3: Decisions (Examine the Reasoning)

**Questions to ask:**

- What choices did they make?
- Why this approach instead of another?
- What seems intentional vs. accidental?
- What seems to be working well?
- What seems weak or problematic?

**Document:**
- Key design decisions
- Trade-offs they chose
- What they seem to value
- Potential weaknesses or limitations

**Dimension:** Criticality — Question your own assumptions about what is good.

---

### Phase 4: Language (Notice the Details)

**Questions to ask:**

- How do they describe things?
- What terminology do they use?
- How is information presented?
- What visual or verbal patterns repeat?

**Document:**
- Distinctive vocabulary or phrases
- Naming conventions
- How they explain difficult concepts
- Recurring visual or structural themes

**Dimension:** Generativity — Open yourself to how they think about the problem.

---

### Phase 5: Transferability (Assess Fit)

**Questions to ask:**

- Is this insight relevant to your current problem?
- What would need to change to make it work in your context?
- What is too embedded in their situation to transfer?

**Document:**
- What seems universally useful (principle level)
- What is context-dependent (project specific)
- What constraints would you need to work around

**Dimension:** Composability + Criticality — Honest assessment of what fits and what doesn't.

**Next Step:**
Once you've assessed transferability, move to `application.md` to choose between Direct, Adapted, or Rejected application types based on your findings.

---

## Analysis Template

Use this structure when documenting your analysis:

```markdown
# Reference Analysis: [Source Name]

## Positioning
- Intent/goal
- Problem it solves
- Context/constraints

## Structure
- Organizational logic
- Main components
- How they connect

## Key Decisions
- What they chose
- Why (inferred)
- Trade-offs visible

## Language & Patterns
- Distinctive vocabulary
- Recurring themes
- How they explain things

## Transferable Insights
- What applies to your work
- What is context-dependent
- What would need adaptation

## Non-Transferable Specifics
- What is too embedded in their context
- What would break if copied
- What belongs to their problem only

## Recommendation
- How this could inform your work
- Where to apply it
- Next steps for testing

## Confidence Level
- High / Medium / Low
- Why you chose this level
```

---

## Dimension Priority in Analysis

### For Design References
**Prioritize:** Composability (structure) + Criticality (what works, what doesn't)

### For Methodology References
**Prioritize:** Generativity (multiple perspectives) + Criticality (assumptions)

### For Pattern/System References
**Prioritize:** Composability (modularity) + Clarity (how it's organized)

### For Competitor/Adjacent Work
**Prioritize:** Criticality (strengths/weaknesses) + Generativity (what else is possible)

---

## Key Principle

Do not extract directly. Extract the principle.

**Wrong approach:**
> "They use a grid of cards with icons. I should use cards with icons too."

**Right approach:**
> "They organize information into scannable chunks with visual anchors. How could I apply this principle to my context differently?"

---

## Integration with Astra Workflow

After analysis, use the Reference Analysis in your task:

1. **Explore Phase:** Use reference analysis to expand the problem space
   - Gather multiple perspectives
   - Surface different approaches
   - Stay open to new ideas

2. **Judgment Phase:** Use reference analysis to test assumptions
   - Does their approach solve the same problem?
   - What would work differently in your context?
   - Which insights are actually relevant?

3. **Convergence Phase:** Decide what to promote to Astra
   - Is this insight general enough to reuse?
   - Does it fit Astra's principles?
   - Is it documented clearly enough for others to use?

---

## When to Converge This Work

A reference analysis becomes an Astra update when:

- The insight is **reusable across multiple projects** (not just your current one)
- The principle is **general enough** that someone else could apply it
- The **documentation is clear** for future use
- It represents a **validated discovery**, not a one-time experiment

If uncertain, keep it in the project working layer first.
Test it once. Then converge if it holds up.

---

## Anti-Patterns to Avoid

**Premature Judgment:** Evaluating before you understand
- Risk: You miss what is actually useful
- Fix: Complete positioning + structure before criticality

**Over-Extraction:** Trying to extract everything
- Risk: You drown in detail and miss the principle
- Fix: Ask "what is the rule?" not "what are all the details?"

**Decontextualization:** Ignoring how their context shaped their choices
- Risk: You copy solutions that do not fit your problem
- Fix: Always ask "why this in their situation?"

**One-Reference Thinking:** Treating one example as universal
- Risk: You mistake their choice for a best practice
- Fix: Analyze multiple references before converging

---

## Quick Analysis (Light Version)

When you do not need a full analysis:

```markdown
# Quick Reference: [Source]

## What they did
[1-2 sentences]

## Why it might matter
[1-2 sentences]

## How it could apply
[1-2 sentences]

## Uncertainty
[What you are not sure about]
```

Use the full protocol only when the reference will significantly influence your work.
