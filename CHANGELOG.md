# Changelog

All reusable Astra updates are recorded here.

The changelog is append-only.

## Unreleased

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
