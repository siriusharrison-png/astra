# Patterns

## Path Patterns

### Exploratory Path

Use when the problem space is unclear and needs discovery.

### Judgment Path

Use when the goal is known and the task is mostly about choosing.

### Execution Path

Use when the direction is already known and the task is to produce an executable output.

### Hybrid Path

Use when the task needs a short exploration loop before moving into judgment and execution.

## Path Switch Signals

- Switch from exploratory to judgment when the problem definition becomes stable
- Switch from judgment to execution when the decision is sufficiently clear
- Switch from execution back to exploratory when a hidden constraint appears
- Switch to hybrid when the task begins clear but reveals ambiguity during the work

## Task Framing Pattern

Before choosing a path, ask:

1. What kind of task is this?
2. What is already known?
3. What is still uncertain?
4. What would be the lightest useful path?

## Design Thinking Pattern

- Discover
- Define
- Develop
- Deliver

This is a useful pattern for complex design work, not a universal rule.

## Output Pattern

When the work is done, the output should usually include:

- the chosen path
- the conclusion or direction
- the reusable rule or insight
- the next action, if needed

## Interaction Decision Pattern (UX Laws)

When making layout, navigation, form, or information-density decisions, reason from established UX laws rather than taste. The three core laws cover most day-to-day cases:

- **Fitts's Law (1954)** — `T = a + b·log₂(D/S+1)`. Bigger and closer targets are faster to hit. Enlarge touch targets; place primary actions at edges/corners/bottom. Caveat: oversized controls break hierarchy — balance reachability against composition.
- **Hick's Law (1952)** — `RT = a + b·log₂(n)`. Decision time grows with the number of options. Reduce and group choices, use progressive disclosure, highlight a default. Caveat: over-pruning just pushes complexity into deeper levels — balance breadth against depth.
- **Miller's Law (1956)** — ~7±2 chunks in short-term memory, **but design for ~4±1** (Cowan, 2001, corrected Miller's figure once chunking/rehearsal are controlled). Chunk long strings (phone 3-4-4), split dense flows into steps. 7±2 is a reference, not a rule.

**Universal lever:** grouping/chunking satisfies both Hick (fewer choices per step) and Miller (less to hold at once). Combine all three — don't optimize one in isolation: fast to operate, fast to decide, light to remember.

**Extended catalog** (less frequent cases): Jakob's Law (match familiar patterns), Tesler's Law (shift irreducible complexity to the system), Doherty Threshold (<400ms response), Peak–End Rule (design peaks and endings), Aesthetic–Usability Effect, Law of Proximity, Serial Position Effect, Von Restorff Effect, Zeigarnik Effect, Postel's Law. Canonical collection: Laws of UX (Jon Yablonski, lawsofux.com).

**Gestalt grouping** — the whole is more than the sum of its parts; the eye
auto-organizes scattered elements into groups. Before styling, answer: how many
groups does the user see, which matters, where does the gaze go? Seven
principles, in rough priority — **proximity > similarity > continuity > closure
> figure-ground / simplicity / common-fate**; proximity and similarity carry
most UI work.

- *Which elements group together:* **Proximity** (distance is the strongest
  signal — tight gap within a group, wide gap between groups); **Similarity**
  (shared color/shape/size reads as one class); **Continuity** (eyes follow
  aligned lines/curves); **Closure** (the mind completes partial shapes).
- *Figure vs. ground:* **Contrast** pushes the subject forward; **Simplicity /
  Prägnanz** favors simple, symmetric forms; **Common Fate** groups elements
  that move or animate together.
- *Levers & heuristic:* adjust spacing before style — e.g. a list item's title
  and meta 8px apart, but 24px to the next item, makes scan boundaries obvious
  (proximity); give same-role text identical color/weight for instant
  association (similarity).
- *Anti-patterns:* whitespace serves grouping, not emptiness — tune to
  information density, more is not better; similarity needs only the core trait
  (color/shape), not identical styling; principles are always in play at once —
  combine, don't apply one in isolation.

---

## Quality Dimensions in Paths

Use these guidelines to decide which design quality dimensions to prioritize for your task path.
Reference the dimensions defined in `standards.md`.

### Exploratory Path

**Primary dimensions:**
- **Generativity** — Multiple perspectives, open to new information. Diverge first, do not close prematurely.
- **Criticality** — Surface assumptions. Ask what is working and what should be questioned.

**Secondary dimensions:**
- Clarity — Emerging clarity during exploration; finalize later.

### Judgment Path

**Primary dimensions:**
- **Criticality** — Test assumptions. Examine tradeoffs. Hold positions lightly.
- Clarity — Make the decision criteria explicit so others can follow the reasoning.

**Secondary dimensions:**
- Responsiveness — Show causality: why this choice leads to the desired outcome.

### Execution Path

**Primary dimensions:**
- Clarity — Instructions must be obvious. The next step must be unambiguous.
- Refinement — Details matter when knowledge moves to someone else.

**Secondary dimensions:**
- Composability — Will this output work across contexts, or is it one-off?
- Responsiveness — Can the executor verify progress and adjust course?

### Hybrid Path

**Primary dimensions:**
- **Generativity** — Exploration phase: open to discovery.
- Clarity — Transition phase: crystallize what was learned before moving to execution.
- Refinement — Execution phase: polish the direction before handing off.

**Secondary dimensions:**
- **Criticality** — Throughout: maintain skepticism as new information arrives.
