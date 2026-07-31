# Quick Commands for Astra — Project Frame

## Task Definition

Create a quick-command system that allows users to invoke Astra guidance from any project without reading full documentation.

Goal: Make Astra immediately useful across projects by providing:
- Quick entry points for common situations
- Copy-paste ready commands or prompts
- Fast path from "I have a task" to "I know what to do"

## What is Known

- Astra has 6 protocols (path-selection, handoff, reference-analysis)
- Astra has 5 dimensions in standards.md (Clarity, Refinement, Responsiveness, Composability, Generativity, Criticality)
- Astra has path types (Exploratory, Judgment, Execution, Hybrid)
- Users need fast guidance when working in other projects
- README has Quick Navigation table (10 situations mapped to files)
- Convergence, Workflow, and Application files exist

## What is Uncertain

- How to structure quick commands (by situation? by layer? by frequency?)
- What format works best for copy-paste (markdown? shell script? code snippet?)
- How many quick commands are enough (5? 10? 20?)
- Should quick commands live in Astra main or in a separate quickstart file?
- How to keep quick commands aligned with changes in core files

## Context Weighting

| Dimension | Assessment | Weight |
|-----------|-----------|---------|
| Output Scope | Reusable across all projects | HIGH |
| Cross-Project Relevance | Pure Astra improvement | HIGH |
| Handoff | Will be used by different agents in different projects | HIGH |
| Stability | This will likely stay stable once validated | MEDIUM |
| Convergence Timing | High reuse probability; converge after validation | HIGH |

## Chosen Path

**Hybrid (Exploration → Judgment → Execution)**

1. **Exploration phase:** Analyze how Astra is actually used to identify most common situations
2. **Judgment phase:** Decide on structure and format for quick commands
3. **Execution phase:** Build quick command file with copy-paste ready content

## Expected Output

- `QUICKSTART.md` — Main quick-reference file
- Quick commands mapped to:
  - 10 common situations (what to do when...)
  - Pre-written prompts for Claude Code
  - Copy-paste templates for task framing
  - Decision trees for path selection

## Success Criteria

✓ Can access any quick command within 10 seconds  
✓ Commands work across different projects without modification  
✓ At least 80% of common Astra usage patterns covered  
✓ No need to read 3+ files to get started  
✓ Can be loaded as a skill or MCP resource  

