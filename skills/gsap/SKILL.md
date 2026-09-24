---
name: gsap
description: Use when designing or building web animations and transitions with GSAP — entrances, exits, scroll-triggered reveals, hover/press feedback, staggered lists, page/route transitions, SVG and text effects. Maps a plain-language description of a motion to a concrete, copy-paste GSAP recipe with the right easing, timing, and accessibility guards.
---

# GSAP Motion Recipes

**Describe the motion you want. Get the recipe.** This skill turns "fade the cards in one after another" or "slide the panel in from the right" into working GSAP code with sensible easing, duration, and a `prefers-reduced-motion` guard.

It is a design-base capability: pick a recipe by intent, adjust the tokens, ship it. Do not hand-tune curves from scratch each time — the defaults here already read well.

---

## Setup (assume unless told otherwise)

```html
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.13.0/gsap.min.js"></script>
<!-- Only when the recipe needs it: -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.13.0/ScrollTrigger.min.js"></script>
```

```js
// module / bundler form
import { gsap } from "gsap";
import { ScrollTrigger } from "gsap/ScrollTrigger";
gsap.registerPlugin(ScrollTrigger);
```

As of 2024, all former Club GSAP plugins (SplitText, MorphSVG, DrawSVG, etc.) are **free**. GSAP 3.13+ works without a license.

---

## Motion tokens — the defaults everything uses

Keep motion consistent by pulling from one small set. Adjust these, not individual tweens.

| Token | Value | Use for |
|---|---|---|
| **Duration — micro** | `0.2s` | hover, press, toggle feedback |
| **Duration — base** | `0.4–0.6s` | entrances, exits, most UI motion |
| **Duration — grand** | `0.8–1.2s` | hero reveals, page transitions |
| **Ease — entrance** | `"power3.out"` | things arriving (decelerate into place) |
| **Ease — exit** | `"power2.in"` | things leaving (accelerate away) |
| **Ease — move/settle** | `"power2.inOut"` | position changes, morphs |
| **Ease — playful** | `"back.out(1.7)"` | badges, pills, small pops |
| **Ease — bounce/elastic** | `"elastic.out(1, 0.5)"` | use sparingly; strong personality |
| **Stagger** | `0.06–0.1s` | gap between items in a list reveal |
| **Distance** | `16–40px` | how far an element travels on enter |

Rule of thumb: **arrive slow, leave fast.** Entrances use `*.out`, exits use `*.in`.

---

## Accessibility — always include

Wrap motion so it collapses to instant for users who ask for reduced motion. Put this around any decorative animation.

```js
const reduce = window.matchMedia("(prefers-reduced-motion: reduce)").matches;

gsap.matchMedia().add("(prefers-reduced-motion: no-preference)", () => {
  // full animation here — only runs when motion is allowed
});
// Elements should be styled visible by default in CSS, so reduced-motion users
// see the final state with no tween. Never leave content hidden behind JS-only reveals.
```

---

## Recipes by intent

### "Fade it in" / "reveal on load"
```js
gsap.from(".el", { opacity: 0, y: 24, duration: 0.6, ease: "power3.out" });
```

### "Slide in from the right" (panel, drawer, toast)
```js
gsap.from(".panel", { xPercent: 100, duration: 0.5, ease: "power3.out" });
// from left: xPercent: -100 · from bottom: yPercent: 100
```

### "Bring the cards in one after another" (staggered list)
```js
gsap.from(".card", {
  opacity: 0, y: 20, duration: 0.5, ease: "power3.out",
  stagger: 0.08,            // gap between items
});
// grid wave instead of a line:
// stagger: { each: 0.06, from: "start", grid: "auto" }
// center-out: stagger: { each: 0.06, from: "center" }
```

### "Reveal as I scroll to it"
```js
gsap.from(".section", {
  opacity: 0, y: 40, duration: 0.7, ease: "power3.out",
  scrollTrigger: {
    trigger: ".section",
    start: "top 80%",        // when section top hits 80% down the viewport
    toggleActions: "play none none reverse",
  },
});
```

### "Pin this and animate while scrolling through it" (scrubbed)
```js
gsap.to(".layer", {
  yPercent: -50, ease: "none",
  scrollTrigger: {
    trigger: ".hero",
    start: "top top", end: "bottom top",
    scrub: true,             // ties progress to scroll position
    pin: true,               // hold the section in place
  },
});
```

### "Hover feedback" (lift / scale)
```js
const el = document.querySelector(".btn");
el.addEventListener("mouseenter", () =>
  gsap.to(el, { scale: 1.04, duration: 0.2, ease: "power2.out" }));
el.addEventListener("mouseleave", () =>
  gsap.to(el, { scale: 1, duration: 0.2, ease: "power2.out" }));
```

### "Little pop" (badge, added-to-cart, success)
```js
gsap.from(".badge", { scale: 0, duration: 0.4, ease: "back.out(1.7)" });
```

### "Count up a number"
```js
const obj = { val: 0 };
gsap.to(obj, {
  val: 1280, duration: 1.2, ease: "power2.out",
  onUpdate: () => (el.textContent = Math.round(obj.val).toLocaleString()),
});
```

### "Animate text word-by-word / letter-by-letter"
```js
gsap.registerPlugin(SplitText);
const split = new SplitText(".headline", { type: "words,chars" });
gsap.from(split.chars, {
  opacity: 0, yPercent: 100, duration: 0.6, ease: "power3.out", stagger: 0.02,
});
```

### "Draw an SVG line / icon stroke"
```js
gsap.registerPlugin(DrawSVGPlugin);
gsap.from(".line", { drawSVG: "0%", duration: 1, ease: "power2.inOut" });
```

---

## Sequencing — "then this, then that"

Use a **timeline** whenever more than one thing happens in order. Never chain `setTimeout`.

```js
const tl = gsap.timeline({ defaults: { duration: 0.5, ease: "power3.out" } });
tl.from(".logo", { opacity: 0, y: 20 })
  .from(".nav", { opacity: 0, y: 10 }, "-=0.3")   // overlap: start 0.3s early
  .from(".hero", { opacity: 0, scale: 0.98 }, "<") // "<" = start with previous
  .from(".cta", { opacity: 0, y: 16 }, "+=0.1");   // "+=0.1" = 0.1s gap after
```

Position parameter cheatsheet: `"<"` start with previous · `">"` after previous ends · `"-=0.3"` overlap by 0.3s · `"+=0.2"` gap of 0.2s · `1.5` absolute time.

---

## Page / route transitions

**Out then in.** Animate the old view out, swap, animate the new view in.

```js
async function transition(swapDOM) {
  await gsap.to(".page", { opacity: 0, y: -20, duration: 0.3, ease: "power2.in" });
  swapDOM();                                   // your framework swaps content here
  gsap.from(".page", { opacity: 0, y: 20, duration: 0.4, ease: "power3.out" });
}
```

In React/Vue, run the "out" tween in the leave hook and the "in" tween on mount. Return a cleanup that calls `tl.kill()` / `ScrollTrigger.getAll().forEach(t => t.kill())` on unmount.

---

## Common mistakes → fixes

| Symptom | Cause | Fix |
|---|---|---|
| Flash of final state before animating | Element visible in CSS, then `from()` runs late | Use `gsap.set()` or `autoAlpha`, or set initial state in CSS and `from` on load |
| Content invisible for reduced-motion users | Reveal lives only in JS | Style visible by default; only *animate* under `no-preference` |
| Janky scroll animation | Animating `top/left/width` | Animate `x/y/scale/opacity` (GPU-friendly) instead |
| ScrollTrigger positions wrong after load | Layout changed (images, fonts) | `ScrollTrigger.refresh()` after load, or set media dimensions |
| Animations leak / stack in SPA | Tweens not cleaned up | `tl.kill()` and kill ScrollTriggers on unmount |
| Motion feels robotic | Linear ease or uniform timing | Apply the ease tokens; arrive `*.out`, leave `*.in` |

---

## When to reach for what

- **One property, one element** → `gsap.to()` / `gsap.from()`.
- **Several things, in order** → `gsap.timeline()`.
- **Tied to scroll** → add a `scrollTrigger`; `scrub: true` only when progress should track the scrollbar.
- **Many similar elements** → one tween + `stagger`.
- **Enter/leave of a whole view** → out-then-in pattern with `async/await` on the out tween.

Keep the token table as the single source of timing and easing. If a design needs a different feel, change the token, not the individual tweens.
