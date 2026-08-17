# Design System Spec Template (DESIGN.md)

## Purpose

A fill-in token spec you hand to an AI coding agent so generated UI matches a target
brand or reference. Extract concrete values (not adjectives) from a reference site,
then reuse the same spec across a project for consistency.

Method: `patterns.md` → Design Token Extraction Pattern.
Deeper analysis: `protocols/reference-analysis-protocol.md` Phase 4 (Visual Language).

## How To Use

1. Pick a reference (a site whose look fits your goal).
2. Read its actual values — inspect colors, fonts, radii; don't guess from memory.
3. Fill each field below with exact values. Leave a field blank rather than inventing.
4. Save as `DESIGN.md` in the target project; point the agent at it.
5. Keep a link to the source. Extract tokens, not layouts (see the pattern's boundary).

---

## Template

### Source
- reference url:
- reference name:
- date extracted:

### Color System
- primary:            <!-- hex + where it's used -->
- accent:             <!-- hex + where it's used -->
- background:         <!-- hex; note light/dark if both -->
- surface / card:     <!-- hex -->
- text (primary / secondary):
- semantic (success / warning / error), if any:
- tone note:          <!-- warm/cool, high/low contrast -->

### Typography
- heading font + weights:
- body font + weights:
- code / mono font:
- scale (largest → smallest, px or rem):
- tracking / letter-spacing:
- line-height:

### Shape Language
- corner radius (default / small / large):
- button shape:       <!-- pill / rounded / square -->
- border style:       <!-- weight, color, or none -->

### Decoration Strategy
- imagery:            <!-- photography / illustration / none -->
- gradients:          <!-- yes/no, where -->
- shadows / elevation:
- signature move:     <!-- the one distinctive brand device -->

### Structural Rhythm
- whitespace density:
- section layout:     <!-- alternating bands / full-bleed / contained -->
- grid:

### Notes
- what to borrow:
- what to adapt for this project:
- what NOT to copy (layout / structure / brand-specific):
