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

## Matrix Design Completeness Pattern

When a design spans two or more crossing dimensions (role × module, state × action, device × context, plan × feature), two failures recur:

- **Split each dimension into its true axes before enumerating.** A dimension that looks single often hides two orthogonal ones — treating it as one leaves a silent gap. Classic case: a "permission" is really *access* (can this actor reach the module) **and** *operation* (what can they do once inside); covering only reach leaves every operation ungoverned. Ask of each dimension: is this one axis or several collapsed into one?
- **Mock/sample data must fill one full standard scenario.** Populate enough combinations that every value of every axis actually appears on screen. When the data is thin, missing combinations never render, so the gap stays invisible and gets shipped. Sufficient data is what makes an omission surface at review time.

Origin: 权限管理设计复盘 — role × information: access permissions were designed, per-role operation permissions were missed because the mock data never exercised them.

## Cross-Artifact Consistency Pattern

When judging a system that spans many artifacts (multi-page, multi-screen, multi-state), the primary quality signal is whether the same business fact stays **semantically uniform** across every artifact — not output volume, not the polish of any single artifact.

- **Why it is the primary signal:** inconsistency fails silently. A single-artifact flaw is visible at a glance; a cross-artifact mismatch (one object named `customerId` here and `leadId` there, a state's meaning drifting per page) only surfaces after walking the whole flow, and it compounds with scale.
- **How consistency is produced:** not by vigilance, but by a single authoritative source that downstream artifacts reference — define the fact once, reference the stable ID everywhere else. Same mechanism as convergence's define-once.
- **Boundary — semantic consistency, not formal sameness.** This governs business facts: naming, state model, a change propagating to all affected artifacts. It does **not** mean artifacts should look alike or share one layout — that is exactly the "rigid consistency / sameness everywhere" Composability (`standards.md`) warns against. When the two appear to conflict, Composability's judgment on form stands; this pattern claims only the semantic layer. It adds a lens, it does not override existing dimensions.
- **Scope:** value rises with the number of artifacts and the number of people building them. For small or single-author work, semantic consistency is cheap and near-automatic — do not over-engineer it. The metric is tool-neutral; it applies to any multi-artifact design review. Cross-reference: [[Matrix Design Completeness Pattern]] — both use walkthrough/data to expose silently-missing cases.

Origin: extracted from a Mihua Design article arguing page count no longer measures product-generation capability. The reusable kernel is the consistency-over-volume metric, separated from the vendor's seven-layer product framing.

## Product-Led Landing Page Pattern

When a product has strong visual or generative output (video, imagery, live rendering, generated worlds), its landing page should let the product carry the persuasion. Four moves recur:

- **Product-as-hero.** Use the real product output as the hero visual, not decorative illustration or abstract 3D. When the output itself is the proof, showing it beats describing it — credibility is not on the same scale. This only holds when the output is genuinely strong; a weak product exposed as hero backfires.
- **Dark canvas, self-luminous content.** A near-black background makes colorful media appear to emit light, maximizing contrast and focus. Use for any interface built to spotlight visual content (portfolios, media libraries, players, galleries). Hard prerequisite: text or UI set over video/imagery **must** carry a scrim (gradient darkening layer) — without it, some frames destroy legibility. The scrim is the invisible condition that makes the whole approach safe.
- **Information architecture as argument.** Navigation order can itself carry a thesis. Sequencing sections to trace a deliberate path (e.g. bottom-up from infrastructure to end product) signals a claim — here, full-stack ownership as a moat. IA sequence communicates positioning, not just wayfinding.
- **Try before talk.** When a playable demo exists, the primary CTA is "Try X"; sales-facing CTAs ("Book a demo", "Contact") stay secondary. Let people experience the product before forcing a conversation. Applies only when the demo is self-serve and strong enough to sell itself.

Boundary: these govern brand/story landing pages for output-strong products. They do not transfer to information-dense tool sites or utility screens, where fast scanning and findability outrank spectacle — a long dark video-heavy page costs load performance and makes information hard to locate. Cross-reference: [[Interaction Decision Pattern (UX Laws)]] for the scanning/findability side.

Origin: extracted from a visual + information-architecture analysis of the Decart.ai landing page (real-time video / world-model lab). The reusable kernel is the four presentation moves for output-strong products, separated from Decart's specific brand execution.

## Precise UI Naming Pattern

When directing an AI coding agent (or handing off a spec), name UI elements with their standard component names instead of vague descriptions. "Popover", "Combobox", "Segmented Control" — not "that little window", "the dropdown thing", "the toggle bar".

- **Why it works:** naming ambiguity is the cheapest error to remove between design intent and implementation. A shared standard name collapses a round-trip of clarification into a single unambiguous token.
- **How to apply:** when writing a spec or prompt, replace loose words with standard names. When you see an element but don't know its name, reverse-look-it-up. When moving between platforms, use the framework term. The lookup table lives in [[references/ui-naming-dictionary]] (Web + macOS, EN/中文 + AppKit/SwiftUI terms).
- **Distinctions matter:** the table deliberately separates near-synonyms that behave differently — `Popover vs. Dropdown Menu vs. Tooltip`, `Modal vs. Drawer vs. Sheet`, `Badge vs. Chip vs. Pill vs. Tag`. Picking the right one carries interaction semantics, not just a label.
- **Boundary:** this is about precision in communication, not vocabulary policing. Use the name that removes ambiguity for the reader; don't force obscure terms where a common word is already unambiguous.

Origin: Learn UI Name (learnui.qiaomu.ai). The reusable kernel is the naming-precision rule; the term list is maintained separately as reference data so it can grow without touching this pattern.

## Design Token Extraction Pattern

To make an AI produce on-brand UI, give it a design-token spec (a `DESIGN.md`) rather than adjectives. Extract the spec by reading a reference site's concrete values, not its vibe.

- **What to capture:** color system (exact hex + role: primary/accent/background), typography (heading/body/code families, weights, sizes, tracking, line-height), shape language (corner radius, pill vs. square), decoration strategy (photography/gradient/illustration/shadow), structural rhythm (whitespace, alternating bands). Template: [[templates/design-system-spec-template]].
- **Why a spec beats adjectives:** "make it feel like Stripe" is unresolvable; `#635BFF accent, Söhne headings at 600, 8px radius, generous whitespace, subtle gradients` is executable. Precise values transfer; impressions don't.
- **How it connects:** this is a focused specialization of `protocols/reference-analysis-protocol.md` Phase 4 (Visual Language) — same extract-the-value discipline, output shaped as a reusable token file. Reuse the extracted `DESIGN.md` across an entire project so all AI-generated screens stay consistent (see [[Cross-Artifact Consistency Pattern]] — the DESIGN.md becomes the single authoritative source).
- **Boundary:** extract tokens, not layouts. Copying a competitor's exact structure is theft and rarely fits your problem; extracting a color/type/shape system and re-composing it is legitimate design work. Don't hoard other people's specs wholesale — extract when you need one, keep a link to the source.

Origin: Learn UI Name design-system library (learnui.qiaomu.ai/sites), which publishes copyable DESIGN.md files for 74 known sites. The reusable kernel is the extraction method + token structure, kept separate from any specific site's values.

## Design Style Identification Pattern

Before extracting a design into tokens, name the style and lock its defining signals. A style is a reproducible set of visual conventions; naming it tells you *what to look for* before you measure anything.

- **Pairs with token extraction:** style identification is the qualitative layer, [[Design Token Extraction Pattern]] is the quantitative one. Name first, measure second — "this is neobrutalism" tells you to look for hard black borders and harsh offset shadows; "this is claymorphism" points you to fat rounded corners, soft shadows, pastels. The name scopes the token hunt.
- **Fixed description dimensions:** decompose any style into the same axes so descriptions stay comparable — color (palette, saturation, emotional temperature), typography (family, weight, case, spacing), shape & border (radius, strokes, offset), texture & material (glass, paper grain, metal), decorative elements (starbursts, gears, scanlines, grids), motion & depth (layered shadow vs. flat vs. 3D), and historical context (origin, era, cultural meaning).
- **Recognition workflow:** visual intuition → extract 3–5 *defining signals* (the few traits that make it unmistakable) → name it, ruling out look-alikes → state the core metaphor in one line ("glass", "paper", "machine") → output as a developer-usable brief.
- **Boundary:** a style name is a communication anchor, not a cage. Most real interfaces blend or lightly reference a style rather than executing it purely; name the dominant influence, don't force a screen into one label. And identify styles from concrete signals, not vibes — if you can't name 3 defining signals, you haven't identified it yet.

Origin: Learn UI Name style catalog (learnui.qiaomu.ai/styles), a governed catalog of 64 visual styles each described on consistent axes. The reusable kernel is the identification method + dimensional framework, kept separate from the specific style list (which is external, evolving data — not copied in).

## Reflective Questioning Pattern (反问机制)

> Status: draft under validation (2026-08-25). Structure agreed; refine after real use.

When discussing an approach or gathering context, pull background from the asker through questions instead of silently accepting assumptions. This is not a quiz and not a standalone chat — it is a **closed loop: ground → probe → agree → push to an artifact**. Modeled on the brainstorming discipline (explore context first, one question at a time, end on approval).

- **Trigger only when it earns its place.** Ask back when (a) the task is vague, (b) you are about to build on an unverified key assumption, or (c) you are in the discuss-approach / add-context stage. When the direction is already clear (execution path), act — do not ask. Unbounded questioning becomes noise (same failure mode as Hick's Law).
- **The core read: diverge or converge?** For a one-line request or a shown leaning ("I have a few ideas but don't know which"), first decide what they need — *guided divergence* (open the space, offer directions) or *reflective convergence* (dig for the missing signal that locates the core problem). Maps to the double-diamond: divergence → widen; convergence → questions that narrow to the real question.
- **Ground before you ask (do your homework first).** Before questioning, self-serve what is checkable — search, read the current state, pull references, compare. Split the information: what you *can* find out is your job; only what *only the asker knows* (intent, leaning, tradeoff) is worth a question. Asking for self-checkable facts pushes your cost onto them.
- **Every question stands on checked fact.** Questions carry external grounding — evidence, references, the actual current state — not blank guesses. "These three values conflict across token/component/spec — which is canonical?" beats "is there an inconsistency?". Grounding is what makes a probe locating instead of lazy.
- **State why you ask.** Each question names its reason out loud: what gap it fills, what signal it collects. The asker should feel the *purpose* of being questioned, not just fill in blanks. Naming the reason also lets them correct a wrong premise before answering.
- **One probe at a time, and go deeper.** Ask the single most locating question first; use its answer to choose the next. Questioning is a chain that drills toward the core problem, not one flat batch of parallel choices. Closed choices lower answering cost; open questions when options aren't predictable — but never collapse the whole probe into one multiple-choice round.
- **End on an agreed conclusion.** The probe ends not when *you* infer the core problem, but when you **state it back and the asker agrees**. The conclusion is questioned-out, explicit information — not a private guess. This convergence gate must close before building.
- **Push to an artifact.** Agreement is not the terminus — drive the closed conclusion into a product: a spec, a decision record, a comparison table, the actual change. Questioning that ends in talk alone has not paid off.
- **When to stop, and staying resident.** Close the probe once the information is enough to start, or when the user says begin. Stopping is not disabling — whenever the goal is later added to or changed, re-enter questioning before building on the new goal.
- **What it implies.** Questioning treats the user and the agent as two independent thinkers working in parallel, not a command-execution pair. Each holds its own judgment; the probe is how the two keep their models aligned as the goal shifts.
- **Boundary:** reach the real problem faster, don't defer the work — and don't over-ground a trivial ask. A clear task needs no probe. Cross-reference: [[Interaction Decision Pattern (UX Laws)]] (Hick's Law on choice cost), [[Cross-Artifact Consistency Pattern]] (grounding in the real current state), the double-diamond in `README.md`, and brainstorming's explore-context-first + one-question-at-a-time discipline.

Origin: 转转 requested a "反问机制" mode, refined across several rounds against superpowers' brainstorming into a closed loop — ground (do homework / search / compare first), probe (each question stands on checked fact, reasons externalized, one at a time), agree (close on an explicitly shared conclusion), and push to an artifact. Models user–agent parallel independent thinking. Draft under validation.

## Off-Spec Value Triage Pattern (A/B/C/D)

When a design system is formalized after the code already exists, reality holds many values outside the new spec. The engineer's real fear is not the spec — it's "does off-spec mean I broke a rule, and now must I change it?". Answer it before it's asked: **exceeding a token ≠ a violation.** Off-spec values split two ways — historical debt (should converge) and legitimate exceptions (should stay) — and conflating them either freezes the team or triggers reckless mass edits.

- **Use and triage are two faces of one layered system.** A token system is layered, not a flat list — both *using* it and *fixing* it follow the layers. The use side is a three-tier fallback: **semantic first** (take a token by purpose — "what is this", not "what does it look like"; covers the vast majority), **fall to the fact layer when semantics don't cover the need** (take the raw primitive step directly — this is legitimate, not a downgrade violation), **only when no step fits at all, write a literal value** — and that last case is usually a *scale-gap signal*, so log it as D (Defer) and feed back a new step rather than scattering literals. Semantic is the *basic* usage, never the *only* one; forcing an ill-fitting semantic token is worse than dropping to the fact layer. The triage below (A/B/C/D) is the mirror image — how to classify a value once it's already off-spec.
- **Four buckets, classify before touching:** **A Converge** — visually near a scale step (within threshold) → debt, snap to nearest token. **B Exception** — has a real reason → legitimate, whitelist it, not a violation (skeleton bar heights, small local-stacking z-indexes, responsive widths with no scale, JS-computed values, third-party locked values). **C Delete** — zero refs / dead code. **D Defer** — can't decide yet → mark for review, don't force-fit.
- **Thresholds are a sieve, not a verdict.** Derive the A-class threshold from the *actual scale spacing* (height steps 4px → ±2px; font-size visually sensitive → tighten to ±1px). Hitting the threshold only makes it an A *candidate*; the final snap is the engineer's call, and visually sensitive kinds (font-size, radius) get a designer recheck. Over threshold = not near = goes to B or D. z-index/motion snap by *intent*, not numeric proximity.
- **Ground the "how much" in a real scan, and label the reading.** Produce the off-spec distribution from the actual codebase, not a guess — but a raw count misleads. State the caveats next to the number: "85 off-spec z-indexes" is really ~16 that need work (the 999/9999/99999 arms race) plus ~73 legitimate local-stacking small values; "time-unit scan covered only `ms`, project uses `s`, so it's low — use the transition-shorthand count instead." A number without its reading gets misread as a to-do list.
- **Role boundary is the point.** Design defines rules / scale / thresholds; execution (the replace, the verify, and any "fix debt while we're here") belongs to engineering *doing the acceptance of those rules*. Design does not set the replacement schedule. Writing this boundary into the spec is what lets the engineer act without waiting and without over-reaching.
- **Land it as three separated artifacts, not one blob:** runtime source (the merged tokens), work files (definitions + migration mapping + the scan data & threshold decisions as a paper trail), and a spec doc (states the *rules* — usage / compat / triage / migration — and points at the work files for data, never duplicating it). One rule, stated once.
- **Boundary:** this is for *retrofitting* a spec onto an existing codebase. A greenfield system needs no triage — it just uses tokens. Cross-reference: [[Design Token Extraction Pattern]] (producing the token values), [[Cross-Artifact Consistency Pattern]] (single authoritative source across artifacts), [[Reflective Questioning Pattern (反问机制)]] (surfacing the engineer's unspoken fear before building).

Origin: jiekou-home design-token migration. 转转 defined the rules; engineering would accept-and-execute (including fixing debt during acceptance). Distilled from writing A/B/C/D + scale-derived thresholds + a real off-spec scan into two `diff_design-token*.scss` work files and a `spec_design-token.scss` rules doc, after correcting a substring-match miscount and flagging the ms-vs-s scan caveat.

## Verifiable Specification Pattern

> Status: draft under validation (2026-09-04). Structure agreed; refine after real use.

When writing any spec (PRD, interaction doc, technical proposal), the primary defect that makes it read as amateur is vagueness — a sentence that cannot be turned into an acceptance condition. The rule: **if a line has no testable acceptance criterion, it is not a requirement, it is a slogan.** Force every functional line into a quantified or enumerable form before it ships.

- **The core test: can QA write a test case from this line?** If not, it is underspecified — add the number, the enumeration, the boundary. "Support showing metadata" fails; "each row shows ≤3 metadata items, overflow folds to `+N`, hover expands" passes. The gap between them is exactly what a reader would otherwise have to guess.
- **Four questions convert vague → precise.** For each functional line, ask in order: **quantify** (a number? time / count / char-limit / percentage), **enumerate** (all cases? states / roles / exception types), **boundary** (empty / full / overlong / concurrent?), **feedback** (what does the user see on success vs. on failure?). If the four cannot be answered, the requirement is not yet thought through — mark it to-confirm rather than papering it with confident-sounding prose.
- **Trigger-word blacklist — appears means rewrite or delete.** optimize / improve / enhance / good / friendly / reasonable / flexible / rich / powerful / seamless / better (优化/提升/完善/良好/友好/合理/灵活/丰富/强大/无缝/更好). These are goals, not specifications. If one genuinely states a target, move it to a "success metrics" section with a measurable value; do not leave it inline as if it were a requirement.
- **Boundary — this governs specification lines, not narrative or vision.** Background, rationale, and problem framing legitimately use qualitative language; the rule applies to the lines a builder must implement and a reviewer must accept. Do not quantify a mission statement into false precision. Precision serves the reader who has to act, exactly like [[Precise UI Naming Pattern]] — ambiguity is the cheapest error to remove between intent and implementation.
- **Cross-reference:** the sibling concerns of spec quality live elsewhere and are deliberately not duplicated here — single-source-of-truth for terms (define a term once, reference it everywhere; don't re-explain) is [[Cross-Artifact Consistency Pattern]]'s define-once mechanism; pulling missing signal from the asker before writing is [[Reflective Questioning Pattern (反问机制)]]. This pattern claims only the vagueness → verifiability axis.

Origin: extracted from write-prd skill's Step 4 (表达质量审查). The reusable kernel is the verifiability rule + four-question conversion + trigger-word blacklist, applicable to any spec-type document. The PRD-specific rewrite case library and the full three-rule checklist (which also covers single-source-of-truth and structural de-duplication, both already held by Cross-Artifact Consistency) stay in the write-prd skill as the scenario-level landing.

## Design Deliverable Completeness Pattern (设计产出完整性)

A design deliverable is not complete when only the happy-path "有数据、操作成功" screen is drawn. The primary silent defect is a missing state — it never renders in the mock, so it passes review and breaks in production. **Acceptance requires covering the full state set the flow can actually reach; when a deliverable omits a reachable state, flag it and suggest supplementing — and keep tracking the omission across rounds until it is either covered or explicitly confirmed as not needed.**

- **页面级状态 (view states) to cover:** 空状态 (有容器无数据) · 首次空模板 (从未创建过，需引导入口，区别于普通空状态) · 加载态 (骨架 / spinner，含分页与「加载更多」的中间态) · 无结果 (搜索 / 筛选后为空，区别于空状态) · 错误 / 失败态 · 无权限态。成功态通常隐含在正常渲染里。
- **失败态要按成因细分 (error taxonomy):** 网络不稳定 / 断网 · 请求超时 · 重复提交冲突 · 服务端错误 · 校验失败。每一类的反馈与恢复路径不同 (重试 / 等待 / 去重 / 修改输入)，笼统一个「出错了」不算覆盖。
- **操作反馈 (interaction feedback) to cover:** 操作提示 (动作前 / 内联引导：placeholder、tooltip、约束说明) · 操作反馈 (动作后成功 / 失败的 toast 或内联提示) · 操作冻结 (提交中禁用按钮 + loading，防重复提交，直接对应上面的「重复提交」失败) · 二次确认 (破坏性操作) · 可撤销 (适用时)。
- **The behavioral rule — suggest and persist, don't pass silently.** When reviewing or producing a design, walk the state set above against the flow. For any state the flow can reach but the design doesn't cover, name it explicitly and propose the missing screen / behavior. The force is *suggest*, not *block* — but a single non-adoption does not close the item: keep the omission on watch and re-surface it in later rounds until it is covered or the user confirms it is out of scope. Confirmed-not-needed is a valid close; forgotten is not.
- **Boundary:** only cover states the flow can actually produce — don't invent an empty state for a view that always has data, or a freeze state for a read-only page. Over-enumerating is noise (同 Hick 的选择成本，见 [[Interaction Decision Pattern (UX Laws)]])。Each covered state should carry a testable acceptance criterion, not just a label.
- **Cross-reference:** `maps/state-map.md` is the per-feature *thinking tool* for enumerating states / transitions / recovery; this pattern is the *acceptance bar* that says which must be covered and adds the persist-until-confirmed rule. [[Matrix Design Completeness Pattern]] (fill mock data so missing combinations surface at review), [[Verifiable Specification Pattern]] (each state needs an acceptance criterion, not a slogan).

Origin: 转转 requested that common states (空状态 / 加载态 / 首次空模板) and interaction behaviors (操作提示 / 反馈 / 冻结) be written into the design acceptance standard, with a proactive suggest-and-supplement rule — persisting across rounds until covered or confirmed unnecessary. Error taxonomy (network / timeout / repeated-submission) added on 转转's note that failure states must split by cause.
