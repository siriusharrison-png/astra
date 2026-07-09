# Handoff Protocol

## Purpose

This protocol ensures that design decisions, patterns, and insights transfer clearly between people, projects, or phases without requiring repeated explanation.

Use this when handing off work to another agent, person, team, or project phase.

## Scope

This protocol does not duplicate standards or patterns.
It defines what must be present in a handoff to ensure the next person can act with confidence.

Reference `standards.md` for quality dimension definitions.

---

## Handoff Checklist

Before handing off, verify these elements are in place.

### 1. Clarity (Required)

**What to check:**
- [ ] The goal is stated explicitly (not implied)
- [ ] Next steps are obvious without searching or asking
- [ ] The current state is unambiguous
- [ ] New context that would confuse someone unfamiliar with the project is explained

**How to apply:**
- Use short sentences; long paragraphs hide information
- Name constraints explicitly ("this must be true" vs "you might want to consider")
- If the next person would ask "why this?", answer it in the handoff

---

### 2. Refinement (Conditional)

**When required:**
- The output is meant to be studied or built upon
- The decision affects other projects or decisions
- The handoff is between two agents or teams (not just between phases of the same work)

**What to check:**
- [ ] Details are considered, not rough
- [ ] Decisions are visible in how things were made
- [ ] Nothing feels incomplete or abandoned

**How to apply:**
- Show your thinking, not just the conclusion
- Name what you tested and why something was discarded
- Polish is not about perfection; it is about respect for the next person's time

---

### 3. Generativity (Conditional)

**When required:**
- The next phase will involve further exploration or iteration
- The handoff is from discovery to definition
- The next person will need to extend or adapt the work

**What to check:**
- [ ] Multiple perspectives or options are presented (not just one direction)
- [ ] Points are anchored to evidence or discussion (not arbitrary)
- [ ] Open questions are named explicitly
- [ ] The structure invites participation, not just consumption

**How to apply:**
- If you explored multiple directions, show them; do not hide the ones you rejected
- Name the decision criteria so the next person can make different choices if needed
- Explain what is settled and what is still open

---

### 4. Criticality (Conditional)

**When required:**
- The next person will make decisions based on this handoff
- There are hidden assumptions or risks that could trip them up
- The work involved judging between competing options

**What to check:**
- [ ] Assumptions are named (especially the ones that feel obvious)
- [ ] Tradeoffs are visible ("this is good for X, weak for Y")
- [ ] What is uncertain is called out (not disguised as confident)
- [ ] The reasoning is open to challenge

**How to apply:**
- Flag what you are least confident about
- Explain what would change your mind
- Avoid language that forecloses discussion ("obviously", "everyone agrees")

---

### 5. Composability (Conditional)

**When required:**
- This work might be reused in other projects
- The handoff involves a pattern or template, not a one-off output
- The next person will need to adapt this to a different context

**What to check:**
- [ ] The work is modular (can be used in parts)
- [ ] The context is named (where does this work? where does it not?)
- [ ] The interdependencies are clear
- [ ] The handoff explains what is general and what is project-specific

**How to apply:**
- Separate the reusable rule from the project-specific application
- Name the boundaries ("use this pattern for X type of problem, not Y")
- Show how pieces fit together without forcing them

---

## Handoff Template

Use this structure when preparing a handoff:

```markdown
# Handoff: [Work Name]

## Current State
- What is done
- What is ready to hand off
- What remains (if anything)

## Goal
- The target outcome
- The next phase or milestone

## Key Decisions
- What was chosen
- Why this direction was chosen
- What was not chosen and why

## Context for the Next Person
- What they need to know about the problem
- Constraints they should know about
- Any special considerations

## Open Questions
- What is uncertain
- What needs to be tested
- What would change the decision

## Next Steps
- The first action for the next person
- What information they might need
- Who to ask if blocked

## References
- Links to relevant patterns in Astra
- Links to project-specific documentation
- Links to reference analysis or research
```

---

## Dimension Priority Guide

Use this to decide which dimensions to emphasize based on your handoff type:

### Handoff to Another Agent/Person
**Prioritize:** Clarity + Refinement
- They cannot ask follow-up questions easily
- Details matter because they cannot read your mind

**Secondary:** Generativity (show options) + Criticality (name assumptions)

### Handoff Between Phases (Same Project)
**Prioritize:** Clarity + Generativity
- The next phase needs options, not just one direction
- Clear structure keeps momentum

**Secondary:** Criticality (surface risks) + Composability (if reusable elements exist)

### Handoff to Another Project
**Prioritize:** Clarity + Composability + Generativity
- The context is very different; extra clarity is essential
- Must show what is transferable and what is project-specific
- Multiple perspectives help them adapt

**Secondary:** Criticality (what worked, what did not in the original context)

### Handoff Before Convergence (to Create Astra Update)
**Prioritize:** Generativity + Criticality
- The reusable insight must be clear
- The decision process matters more than the final form

**Secondary:** Clarity (someone else will read this later)

---

## Handoff Review Checklist

Before sending a handoff, ask:

- [ ] Would the next person understand this without asking me?
- [ ] Have I named what I am uncertain about?
- [ ] Is the goal stated, not implied?
- [ ] If this person walks away, could someone else continue?
- [ ] Did I show thinking or just conclusions?
- [ ] Are there hidden assumptions I should name?
- [ ] Is this clear enough for the next phase, or needs more polish?
- [ ] Have I explained what is settled vs. what is still open?

---

## When Not to Use This Protocol

Do not over-apply this protocol.

- One-off handoffs within the same person's continuous work do not need full structure
- Internal working notes do not need refinement or composability
- If the handoff is simple and the next person is available to ask questions, lighter structure is fine

Use your judgment: the protocol exists to reduce friction, not create bureaucracy.
