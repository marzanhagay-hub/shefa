# Design System: High-End Editorial Fintech

## 1. Overview & Creative North Star: "The Digital Private Banker"
This design system moves away from the cluttered, data-heavy aesthetics of traditional fintech. Our Creative North Star is **The Digital Private Banker**. The interface should feel like a bespoke leather-bound ledger or a quiet, sun-lit marble office. 

To achieve this, we reject the "grid-of-boxes" template. We utilize **intentional asymmetry**, where large display typography creates an anchor for the eye, and **negative space** is treated as a premium functional element rather than "empty" space. By overlapping elements—such as a floating glass card subtly breaking the boundary of a background section—we create a sense of three-dimensional depth and architectural intent.

---

## 2. Color Strategy & Tonal Atmosphere
We use a palette of "Intellectual Neutrals" and "Deep Wealth Blues." Every color is muted to ensure the user feels calm, even when managing complex finances.

### The "No-Line" Rule
**Strict Mandate:** Designers are prohibited from using 1px solid borders to define sections. Traditional borders create visual noise and feel "cheap." 
- **Definition through Tone:** Boundaries must be created by shifting background colors (e.g., a `surface-container-low` section placed on a `surface` background).
- **The Ghost Border:** If a boundary is strictly required for accessibility, use the `outline-variant` token at **15% opacity**. Never use 100% opaque borders.

### Surface Hierarchy & Nesting
Treat the UI as physical layers of fine paper.
- **Base:** `surface` (#f8f9fa) is your desk.
- **Sectioning:** Use `surface-container-low` (#f3f4f5) for secondary content areas.
- **Interaction:** Use `surface-container-lowest` (#ffffff) for the highest-priority interactive cards to make them "pop" against the slightly darker background.

### Glass & Gradient Soul
To avoid a flat "Bootstrap" feel, use **Glassmorphism**:
- Floating navigation or modals should use `surface_container_lowest` with an 80% alpha and a `backdrop-blur` of 20px.
- **The Signature Gradient:** For Primary CTAs, use a subtle linear gradient from `primary` (#031631) to `primary_container` (#1a2b47) at a 135-degree angle. This adds a "metallic" sheen that flat color cannot replicate.

---

## 3. Typography: Editorial Authority
We use **Heebo** for its modern, architectural Hebrew letterforms. The hierarchy is designed to feel like a premium financial magazine.

*   **Display (The Statement):** `display-lg` (3.5rem) is used for total balances. It should feel monumental.
*   **Headlines (The Anchor):** `headline-md` (1.75rem) uses tighter letter-spacing to feel authoritative.
*   **Body (The Content):** `body-md` (0.875rem) is our workhorse. Ensure a generous `line-height` (1.6) to facilitate effortless reading of financial data.
*   **RTL Logic:** Typography must always be right-aligned. Numbers (Western Arabic) should maintain their legible spacing while co-existing with Hebrew scripts.

---

## 4. Elevation & Depth: Tonal Layering
We move away from the "shadow-on-everything" approach. Depth is earned, not given.

*   **The Layering Principle:** Instead of a shadow, place a `surface-container-highest` card inside a `surface` container. The 4-5% shift in gray value is enough for the human eye to perceive depth without the "clutter" of a shadow.
*   **Ambient Shadows:** For elements that truly float (like a bottom sheet or a primary action button), use an **Ambient Shadow**:
    *   `box-shadow: 0 12px 32px -4px rgba(3, 22, 49, 0.08);`
    *   Note: The shadow uses a tint of our `primary` blue (#031631) instead of pure black, making it feel integrated into the environment.
*   **Logical RTL Shadows:** Light source is assumed to be top-right. Ensure shadows subtly shift to account for the RTL eye-tracking flow.

---

## 5. Signature Components

### Primary Action Buttons
- **Style:** `rounded-xl` (1.5rem radius) for a soft, approachable luxury. 
- **Color:** The Signature Gradient (Deep Blue).
- **Interaction:** On hover, do not change color; instead, apply a subtle `surface-tint` overlay to "brighten" the button from within.

### Abundance Cards (Fintech-Specific)
- **Constraint:** **No Dividers.** 
- Separate "Income" and "Expense" items using vertical whitespace (Spacing Scale `4` or `1.4rem`).
- **Income Indicators:** Use `tertiary_fixed_dim` (#a6cfc3) for a muted, sophisticated green.
- **Expense Indicators:** Use `error_container` (#ffdad6) with `on_error_container` (#93000a) text for a soft, "alert-without-panic" feel.

### Input Fields
- **Background:** `surface-container-high`.
- **Active State:** Change background to `surface-container-lowest` and add a 1px "Ghost Border" using `surface-tint` at 20% opacity. 
- **Label:** `label-md` floating above the field, never inside, to maintain persistent context.

### The "Pulse" Progress Bar
- For financial goals, use a thick (8px) track in `outline-variant`. The "progress" fill should be a gradient of `primary` to `primary_fixed_dim`.

---

## 6. Do’s and Don’ts

### Do
*   **Do** use the Spacing Scale `6` (2rem) for page margins to create an "expensive" amount of white space.
*   **Do** use `logical properties` (`padding-inline-start` instead of `padding-left`) to ensure perfect RTL rendering.
*   **Do** use "soft-touch" rounding (`rounded-xl`) on all containers to convey "Financial Peace of Mind."

### Don't
*   **Don't** use pure black (#000) for text. Use `on_surface` (#191c1d) to keep the contrast high but the feel "charcoal and soft."
*   **Don't** use standard 1px lines to separate list items. Use a 12px vertical gap instead.
*   **Don't** use vibrant, saturated "Neon" greens or reds. Use the muted tones provided in the `tertiary` and `error` containers to maintain the luxury atmosphere.