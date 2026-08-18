# Astra — What It Is, What It Does, How To Build Your Own

A short, self-contained explainer for anyone curious about this idea. It is not an
install guide and not a product pitch. It answers three questions: what this is,
what it changes in practice, and — if you want your own — which aspects actually matter.

---

## 1. What It Is

Astra is a **local, cross-project foundation that an AI agent loads before it works**.

Instead of re-explaining your rules, your preferred component names, and your working
style every session, you keep them in one place the agent reads first. It is a base of
*rules, structure, language, and decision logic* — the things you reuse across every
project — so different tools and different sessions all start from the same ground.

One line:

> A local operating base for design-support work, designed to keep repeated thinking
> consistent across tools, projects, and sessions.

What it is **not**:

- Not a feature product, and not something end-users touch.
- Not a knowledge dump — content earns its place only if it's reusable across projects.
- Not a homepage or a showcase. It is infrastructure, loaded silently before work.

---

## 2. What It Can Do

Astra is not free value on every task. For a small, unambiguous, one-off request it adds
little. Its value shows up in three situations — and the "without" side below is not a
strawman, it's how a capable agent *actually* behaves by default.

### Ambiguous task — "redesign the settings page"

- **Without:** the agent starts building immediately, guesses the goal, and you find out
  halfway it solved the wrong problem (the real issue was *findability*, not looks).
- **With:** it frames before building — is the goal clear? No → a short exploratory pass
  turns "redesign" into "make settings findable", then works toward that.

### Precision task — "add a dropdown filter"

- **Without:** "dropdown" is ambiguous, so the agent picks one. If you meant a searchable
  typeahead, you learn that after it's built.
- **With:** it distinguishes *Combobox* (search) vs *Dropdown Menu* (pick an action) vs
  *Popover*, confirms which you mean, then builds. A standard name removes a round-trip.

### Repeated work — the same lesson, second time

- **Without:** a preference you set last week is gone next session; you re-explain it.
- **With:** the lesson was captured once and loads every session. Knowledge compounds
  instead of resetting.

The pattern across all three: **without a foundation, each task starts from zero and each
word is taken at face value; with one, tasks start framed, words are made precise, and
lessons persist.** The return scales with ambiguity, precision-sensitivity, and repetition
— and is near-zero without them. Use it where it pays.

---

## 3. How To Build Your Own — Which Aspects Matter

You don't need *this* repo. If the idea fits how you work, build your own. These are the
aspects worth getting right; the specific files matter far less than these decisions.

### Layer by stability, not by topic

Separate content by *how often it's allowed to change*, not by subject:

- **Stable** — what the base *is* and how it's used. Changes rarely and deliberately.
- **Evolving** — recurring patterns and validated lessons. Updated after tasks.
- **Working** — task-scoped drafts and notes. Rewritten freely, never permanent.

The point of layering is that daily churn never destabilizes your core rules. If
everything lives in one pile, either the pile goes stale or you're afraid to touch it.

### Make methods the hook, keep data on demand

Load the *method* every session; load the *data* only when needed. A rule like "name UI
elements with their standard component names" is small and always worth loading — the
62-entry lookup table it points to is not. Keeping the trigger separate from the payload
is what stops the foundation from bloating: methods stay lean and always-on; reference
data grows freely off to the side without slowing every session.

### Capture only what's reusable, and capture it deliberately

The failure mode of any knowledge base is becoming a junk drawer. Two guards:

- **Reusability bar** — if a lesson only matters to one task, it stays in the working
  layer and dies there. Promote only what will help *another* project.
- **Confirm before writing** — don't auto-save. At the end of reusable work, *propose*
  what to capture (source / layer / summary), then write only after a human agrees.
  Silence is the correct default; most tasks produce nothing worth keeping.

### One source of truth, synced — not copied

Keep the canonical copy in one place (a git repo works). Machines and agents read a local
copy; updates flow through sync, never hand-copied files. The moment the same rule exists
in two places by hand, they drift and you can't trust either.

### Pick one working language and stay in it

Write the foundation in a single language, consistently. Its whole job is to keep wording
stable so the agent's behavior is stable — mixed or drifting vocabulary quietly reintroduces
the ambiguity the base exists to remove.

---

## The Takeaway

The value isn't the content — it's the *discipline*: layer by stability, hook methods to
data, capture deliberately, sync from one source. Get those right and the foundation stays
small, trustworthy, and genuinely reusable. Get them wrong and you've built another folder
of documents nobody loads.
