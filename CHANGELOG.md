# Changelog

All reusable Astra updates are recorded here.

The changelog is append-only.

## Unreleased

### 2026-08-07

- [evolving] Convergence update
  - source: apikey 创建流程验收：本地 mock 跑通交互后清理并走 PR
  - action: add
  - file: workflow.md
  - summary: Temporary Code Discipline: never commit throwaway verification code (mock/hardcoded/demo seed/switch); safe default so accidental commit can't change runtime; unique greppable marker (MOCK-DO-NOT-COMMIT) + pre-commit grep self-check; every pending-integration point carries an accurate TODO/MOCK note stating root cause + needed alignment; escalate all such items into the PR description.

### 2026-08-06

- [evolving] Convergence update
  - summary: Prefer MIT/Apache methodology-type viz skills over license-restricted bundled-artifact ones; installed tufte-data-viz + data-viz-best-practices as lieflat replacements

### 2026-08-06

- [evolving] Convergence update
  - summary: Before producing professional infographics/journey maps, check for a domain skill first: generic frontend scaffolds only solve 'can render', not 'information matches methodology'. Vet third-party skill licenses before install — skip noncommercial licenses (e.g. PolyForm) in a commercial context, prefer MIT/Apache. For skill collections, clone and check name conflicts first, install only what's needed or the full set, and attach LICENSE + SOURCE.md provenance to each. Installed cuellarfr/design-skills (MIT, 10 UX skills) to global ~/.claude/skills/.

### 2026-08-04

- [evolving] Convergence update
  - summary: Added an applicability boundary to Hick's Law in patterns.md: it serves 'clear goal + fast decide/act' screens; do not over-apply to complex form editing where task completeness and flow continuity outweigh minimizing options.

### 2026-07-31

- [patterns] Convergence update
  - summary: 面向他人的方案陈述用'带开关的对照演示'替代静态描述：投影/机制类方案做成可交互 HTML，双维度切换器显性化正交逻辑，一个'关闭'开关反衬机制价值——本质是给评审方的 A/B 对比手段

### 2026-07-31

- [patterns] Convergence update
  - summary: 内部代理法验证B端用户画像：够不到真实用户时，把画像拆成可证伪假设，找内部代理(数据经理给What/客户成功给Why/PM对分歧/销售补决策链)证实证伪。工具包一份文件=一个动作；分角色脚本拆【A作战地图不给对方看】+【B中立话题共享版一起聊】双模块，B里不把假设当结论说以防对方顺着点头。先约能触达的角色。

### 2026-07-30

- [evolving] Convergence update
  - summary: Add Gestalt grouping to the UX Laws pattern — 7 principles in priority order (proximity > similarity > continuity > closure), spacing as strongest signal with a tight/loose gap heuristic (8px within, 24px between), and three anti-patterns.

### 2026-07-29

- [evolving] Automate Astra sync (hook) and formalize semi-automatic convergence
  - source: user request: auto-load sync, verify /astra command, semi-automate convergence
  - action: add
  - file: scripts/astra-sync.sh, convergence.md, README.md
  - summary: Added SessionStart hook running scripts/astra-sync.sh (silent, ff-only, pull-only) so Astra auto-syncs at session start. Formalized a Semi-Automatic Convergence Protocol in convergence.md and README Working Contract: agent proactively proposes a convergence draft at end of reusable work and writes only after human confirmation; stays silent when nothing reusable emerged. Fixed root cause: ~/astra did not exist (real repo at ~/Desktop/astra) so all ~/astra/scripts references silently failed — created symlink ~/astra -> ~/Desktop/astra.

### 2026-07-28

- [patterns][memory] Interaction decision pattern (UX laws) added to evolving layer
  - source: interaction-design study cards (交互设计三大定律) + primary-literature verification
  - action: add
  - file: patterns.md, memory.md
  - summary: Added an "Interaction Decision Pattern" to patterns.md covering the three core UX laws (Fitts 1954, Hick 1952, Miller 1956) with formulas, the grouping/chunking universal lever, the Cowan (2001) correction of Miller's 7±2 to ~4±1, and an extended catalog of 10 Laws of UX. Recorded a matching cross-project judgment preference in memory.md. Kept within the existing evolving + memory layers rather than adding a new reference/ directory — structure stays stable; content is reusable.
  - note: An earlier draft created reference/interaction-design-laws.md; removed in favor of the evolving-layer approach to preserve the standard four-layer structure.

### 2026-07-18

- [quickstart] Fast-reference guide for cross-project usage
  - source: project testing to improve Astra usability
  - action: add
  - file: QUICKSTART.md
  - summary: Created QUICKSTART.md with copy-paste ready templates, decision trees, and checklists for 10 common situations. Enables users to access Astra guidance from any project without reading 3+ files. Covers task framing, handoff, reference analysis, decision making, and convergence.

- [standards] Documentation Sync Rule enforced by adding QUICKSTART to Quick Navigation table
  - source: standards.md Documentation Sync Rule implementation
  - action: update
  - file: README.md Quick Navigation table
  - summary: Added QUICKSTART.md as top-priority entry in Quick Navigation table (moved to first row), following Documentation Sync Rule that keeps table aligned with actual file additions. QUICKSTART becomes primary entry point for users in other projects needing fast guidance.

### 2026-07-09

- [standards] Design quality dimensions added
  - source: cross-project analysis (Perceptual Protocols reference)
  - action: add
  - file: standards.md
  - summary: Added 6 design quality dimensions (Clarity, Refinement, Responsiveness, Composability, Generativity, Criticality) to provide vocabulary for evaluating design decisions across Astra work.

- [workflow] Context weighting framework added
  - source: task discussion
  - action: add
  - file: workflow.md
  - summary: Added 5 context weighting dimensions (Output Scope, Cross-Project Relevance, Handoff, Stability, Convergence Timing) to adjust path selection for specific task contexts.

- [protocols] Handoff and reference analysis protocols created
  - source: task discussion
  - action: add
  - file: protocols/handoff-protocol.md, protocols/reference-analysis-protocol.md
  - summary: Created two standalone protocols with dimension application guidance. Handoff protocol ensures clarity and completeness in work transfers; reference analysis protocol provides 5-step framework for extracting transferable insights.

- [patterns] Quality dimensions integrated into path guidance
  - source: task discussion
  - action: update
  - file: patterns.md, templates.md
  - summary: Added quality dimension guidance to each path type and template type, clarifying which dimensions are primary vs secondary for specific work contexts.

- [documentation] Quick navigation table and sync rule added
  - source: task discussion
  - action: add
  - file: README.md, standards.md
  - summary: Added Quick Navigation table to README mapping 10 common situations to relevant files. Added Documentation Sync Rule to standards.md ensuring table stays aligned with actual file structure.

### 2026-06-30

- [bootstrap] Initial Astra structure
  - source: manual setup
  - action: add
  - file: README.md
  - summary: Established the initial cross-project foundation, workflow, convergence rules, and templates.

- [documentation] Reference analysis and application flow clarified
  - source: task discussion
  - action: update
  - file: README.md, workflow.md, maps/reference-analysis.md, templates/reference-analysis-template.md, application.md
  - summary: Clarified that Astra is a support layer without a product surface, added the analyze-decide-apply-converge loop, and routed reference analysis output to the target project instead of Astra.

- [documentation] Operational templates expanded
  - source: task discussion
  - action: update
  - file: templates.md, maps/user-journey-map.md, maps/task-flow-map.md, maps/decision-flow-map.md, maps/role-map.md, maps/state-map.md
  - summary: Added reusable map and reference-analysis templates for cross-project design and experience work.

- [installation] One-line install entry added
  - source: task discussion
  - action: update
  - file: README.md, INSTALL.md, scripts/install.sh
  - summary: Added a curl-based one-line installer so Astra can be installed or synced from a single command.

- [skills] Astra skill renamed to /astra for CLI speed
  - source: UX improvement
  - action: update
  - file: skills/astra.md (renamed from astra-quickstart.md)
  - summary: Shortened CLI command from /astra-quickstart to /astra. Now faster to invoke in any project. Installed globally to ~/.claude/skills/astra.md

- [evolving] Storybook page redesigned as a codex-style manual (legacy entry, retained for history)
  - source: project-specific design iteration
  - action: (project change, no Astra file touched)
  - file: (not in Astra scope)
  - summary: Storybook page upgraded from a display page to a browsable codex-style manual. Three changes: (1) stronger paper realism via spine gradient shadows, inset page edges, and a 135° background gradient; (2) tighter typographic rhythm — spacing reduced ~50%, adjusted font sizes for an academic tone; (3) restrained blockquote treatment — Quote/Note/Section backgrounds simplified, borders thinned. Implemented via layered inset box-shadow plus pseudo-element gradients for a 3D page-edge effect.
  - note: This entry documents a change inside a specific project, not an Astra update. Per convergence.md ("do not capture one-off project noise / content that belongs only to a single task"), work like this should not go into Astra's CHANGELOG in future. Kept here for historical completeness only; normalized from a Chinese-only, unstructured entry appended by an earlier version of scripts/converge.sh.
