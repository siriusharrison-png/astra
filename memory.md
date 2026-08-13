# Memory

## Purpose

This file stores reusable cross-project knowledge that evolves over time.

Memory captures validated preferences, judgment patterns, and lessons that repeat across multiple tasks and projects.

## How Memory Relates to Other Layers

- **Stable Layer** (standards.md, principles.md): Rules that are unlikely to change; require confirmation before updating
- **Evolving Layer** (patterns.md, templates.md, workflow.md): Recurring lessons that improve specific work; integrated into files
- **Memory** (this file): Chronological record of preferences and patterns that emerge across projects; kept separately for browsing and historical reference
- **Working Layer** (specs/, task-specific notes): Temporary material that belongs only to current work

Memory is distinct from the evolving layer: evolving updates integrate into the files; memory entries stay here as a reference log.

## Good Candidates for Memory

Add an entry to memory when:

- The same lesson or preference appears in 2+ different projects
- An evolving layer update has been validated by actual use
- You want to preserve a judgment pattern for future reference
- A decision shortcut has proved reliable across multiple contexts
- A preference about how to work is consistent enough to become a default

Examples:

- "Judgment path typically takes 2-3 days for scope definition; explore for longer only if goal is genuinely uncertain"
- "When templates feel too prescriptive, it usually means the underlying process needs clarification, not template simplification"
- "Direct application of design patterns rarely works; almost always needs adaptation for context"

## Memory Entry Shape

When adding a memory item, keep it compact and dated:

```
## [Date] [Category] — [Short Title]

**Lesson:** [The pattern or preference, 1-2 sentences]

**Why it matters:** [When you've seen this repeat; what it affects]

**How to apply:** [Specific contexts where this is useful]

**Confidence:** [High / Medium / Low based on repetitions]
```

## Memory Hygiene

- Do not store raw project noise
- Do not store unstable one-off preferences unless they have repeated 2+ times
- Do not store things already covered by the stable layer (that belongs in standards.md)
- Do not add entries during a task; add them during convergence after validation
- Do remove entries that stop being true after actual use

## When to Remove or Archive an Entry

Remove an entry from memory when:
- You discover it is not actually true in new contexts
- The landscape has changed enough that the lesson no longer applies
- A better rule has replaced it in the evolving layer

Archive the entry in convergence history rather than deleting it; the historical record may be useful later.

---

## Entries

## 2026-07-28 Pattern — Anchor interaction decisions to UX laws

**Lesson:** For layout, navigation, form, and information-density decisions, reason from UX laws instead of taste — Fitts (target size/distance), Hick (option count), Miller (chunking). Design memory load for ~4 chunks, not 7 (Cowan 2001 corrected Miller's 7±2).

**Why it matters:** These decisions recur in every project with a UI. Grounding them in named laws makes choices defensible and consistent across projects, and prevents the common mistakes (bigger-is-better, fewer-is-always-better, strict 7±2).

**How to apply:** See `patterns.md` → Interaction Decision Pattern for formulas, the grouping/chunking universal lever, and the extended catalog. Cite the specific law when justifying a UI decision.

**Confidence:** Medium — established literature, but not yet validated across 2+ Astra projects in practice.

## 2026-08-06 Pattern — Check for a domain skill before producing methodology-bound visuals

**Lesson:** Before building a professional infographic, journey map, or any methodology-bound visual, check whether a domain skill exists first. Generic frontend scaffolds (web-artifacts-builder, plain HTML) only solve "can render" — they do not make the *information* conform to the method. A journey map built without journey-mapping guidance looks like a diagram but carries the wrong content (matrix instead of flow, business funnel instead of user goals/pains/emotions).

**Why it matters:** Surfaced when a hand-built journey "flow" came out as a matrix and the content missed research requirements. The fix was not more visual effort but the right skill (`journey-mapping` from cuellarfr/design-skills).

**How to apply:** For journey/research/design visuals, load the relevant skill (journey-mapping, ux-research, design-critique, etc.) BEFORE choosing a visual form. When vetting a third-party skill: check the License first — skip noncommercial (e.g. PolyForm) in a commercial context, prefer MIT/Apache. For skill collections, clone and check name conflicts against the existing global set before installing; attach LICENSE + SOURCE.md provenance to each installed skill. When a license-restricted skill packages a bundled artifact (e.g. lieflat-charts ships PolyForm-licensed chart bundles), don't use it — find a MIT/Apache *methodology* skill instead (guides the use of native libraries rather than distributing a restricted artifact), so downstream license risk follows the underlying library, not the skill. Replacements installed 2026-08-06: `tufte-data-viz` (Caylent, MIT) for build, `data-viz-best-practices` (callahkate, MIT) for review/accessibility.

**Confidence:** High — root cause was clear and the corrective action (install domain skill, license discipline) is broadly reusable.

## 2026-08-12 Pattern — Package a recurring "explain-the-method" ask as a self-contained skill, not a one-off doc

**Lesson:** When colleagues repeatedly ask the same class of methodology question (this time UX methods: journey map, then stakeholder map, then empathy map…), don't keep producing one-off documents. Identify that the reusable private asset is not the methodology (it's open knowledge — anyone can install journey-mapping) but the **routing + collection boundaries + deliverable format + discipline**. Package that thin layer as a self-contained Claude Code skill: compress each method into an internal card (when-to-use · fields to collect · sources · minimum viable research · in/out-of-scope · syntax · minimal worked example) so it runs WITHOUT the user's colleagues installing any other skill.

**Why it matters:** Surfaced when the user, a designer, wanted teammates to "borrow" their UX capability self-service. Building `ux-method-guide` (router.md + 6 method cards + a reusable HTML deliverable template with emotion curve) turned an ad-hoc favor into a distributable capability. The self-containment decision is the key: depending on colleagues having other skills installed makes it fragile.

**How to apply:** For "make my expertise reusable for others" requests where the audience uses Claude Code + wants full self-service → build a skill, not a Project or static page. Use `skill-creator` (init_skill.py → edit → package_skill.py validates+zips). Structure: lean SKILL.md holding the workflow/discipline, one reference card per variant in a fixed template so new variants are cheap to add, one asset template for the output. Ship with a LICENSE (MIT/Apache) if distributed externally, per [[check-domain-skill-before-methodology-visuals]] license discipline. Keep the shareable artifact project-neutral and desensitized.

**Confidence:** Medium — pattern is clear and broadly reusable, but not yet validated by the colleagues' actual usage / iteration.
