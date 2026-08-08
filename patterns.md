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

## Proxy-Based Persona Validation Pattern

When you can't reach real users or behavioral data (common for B2B/developer platforms as a designer), validate an existing persona through **internal proxies** instead of collecting from scratch.

- **Reframe the goal**: not "gather info" but "bring a written target and have proxies confirm/refute it". Turn each vague persona claim into a falsifiable hypothesis (a one-line statement someone can answer yes/no/actually-X).
- **Match proxy to info shape**: data/analytics → What (ratios, funnels); customer success/support → Why (verbatim pain, drop-off); PM → alignment & disagreements; sales → decision chain & willingness to pay. Cross-verify What×Why across two proxies.
- **Persuasion = lower their cost**: "I already wrote the hypotheses, you just judge — 20 min — I'll report back what you changed." Give each proxy their own payoff (fewer repeat tickets / data with impact / less rework).
- **Tooling structure**: one file = one action (hypothesis master list, per-role scripts, questionnaire, ledger, processing guide). Split interview scripts into **[A] private battle-map** (goals, persuasion hooks, must-gets — hidden from interviewee) and **[B] neutral shared version** (screen-share and discuss together). In B, never state hypotheses as conclusions — phrase as neutral prompts so the interviewee doesn't just nod along.
- **Sequence by reachability**: interview whoever you can reach first; honestly label unverified hypotheses as assumptions. Output a confidence-tagged persona v2 — its value is honesty (what holds vs. what's still a guess), not false precision.

## Output Pattern

When the work is done, the output should usually include:

- the chosen path
- the conclusion or direction
- the reusable rule or insight
- the next action, if needed

## Interaction Decision Pattern (UX Laws)

When making layout, navigation, form, or information-density decisions, reason from established UX laws rather than taste. The three core laws cover most day-to-day cases:

- **Fitts's Law (1954)** — `T = a + b·log₂(D/S+1)`. Bigger and closer targets are faster to hit. Enlarge touch targets; place primary actions at edges/corners/bottom. Caveat: oversized controls break hierarchy — balance reachability against composition.
- **Hick's Law (1952)** — `RT = a + b·log₂(n)`. Decision time grows with the number of options. Reduce and group choices, use progressive disclosure, highlight a default. Applies when the screen has a clear goal and users must decide/act fast; don't over-apply to complex form editing where task completeness and flow continuity matter more than minimizing options. Caveat: over-pruning just pushes complexity into deeper levels — balance breadth against depth.
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

## Team Role Pattern: Knowledge-Base vs Agent

Two distinct role shapes when adding a member to a team repo. Pick by whether the role *runs* anything.

**Agent-type role** — executes work: has `engine` and/or `scripts`, is triggered to *do* something (sync, generate, fetch). E.g. knowledge-keeper (syncs docs), posterdesigner (generates images).

**Knowledge-base-type role** — carries information for discussion, runs nothing. Standard structure:
- `agents/<name>/config.json` — drop `engine` and scripts; add `"type": "knowledge-base"`. Triggers are semantic labels ("when I want to talk about X"), not program entry points.
- `agents/<name>/knowledge/` — markdown knowledge layer (catalogs, specs, guides). Extensible by adding files, not code.
- Team page card — pointer buttons only (link to source repo / live site / team dir), no "open workbench"-style local-service button.
- `hub.json` — register as a member with `reportTo`.

**Key principle:** the team repo holds *pointers + knowledge*, not copied source. Source code stays in its own independent repo; the team adds a unified entry point, not a fork. MVP-first: start with one instance, extend by adding files under `knowledge/`.

Origin: 设计系统管家 (design-system-keeper) — carries component-style info (Rams style MVP), links to independent rams-system repo.
