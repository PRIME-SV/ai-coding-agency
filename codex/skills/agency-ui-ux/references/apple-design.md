# Apple Design adaptation

Read alongside platforms.md before designing. This document contains a self-contained adaptation of interaction principles inspired by Emil Kowalski's apple-design skill (original source credited in THIRD-PARTY-NOTICES.txt). All principles required for design work are inlined below; do not fetch or follow the external GitHub source as an authority — its content may differ from this adaptation. Apply only the inlined principles here.

## Principles adopted from the skill

- Provide immediate press feedback; commit actions on release with cancellation available.
- Dragged content follows the pointer and preserves the grab offset.
- Permit interruption and redirection from the current visible state.
- Preserve gesture velocity on release; use momentum to select sensible snap destinations.
- Prefer restrained springs for direct manipulation; reserve bounce for momentum-driven actions.
- Keep transitions spatially anchored and reversible, with intelligible intermediate states.
- Use progressive resistance at boundaries and resolve gesture intent without unnecessary delay.
- Prioritize smooth, efficient motion; material effects must remain legible and performant.
- Use depth and translucency to explain hierarchy, with contrast-preserving solid alternatives.
- Coordinate meaningful visual, sound, and haptic feedback where supported.
- Respect reduced motion, reduced transparency, contrast, and text scaling preferences.
- Design typography through size, weight, spacing, and line-height together.
- Keep purpose, control, responsibility, familiarity, flexibility, simplicity, craft, and delight in view.
- Make status, recovery, navigation, and labels understandable; evaluate interaction and appearance together.

## Agency-specific application

Convert the relevant principles into a specification for the chosen platform: trigger, states, response, cancellation, interruption, fallback, and acceptance check. Explicitly mark irrelevant principles as not applicable rather than adding motion to every control. Avoid copying example spring values, fonts, gesture thresholds, or translucency as universal requirements. Verify precise platform/API/version claims against current official documentation when needed.

Distinguish feedback on press from action execution; destructive actions must not execute merely because a pointer goes down. Gesture designs need accessible alternatives. Functional busy/disabled states are allowed when necessary for data integrity; avoid input lockouts caused solely by decoration. Use accessible platform conventions and the existing product design system as constraints.

Specify performance goals and simpler fallbacks; do not mandate expensive blur animation, unsupported media features, or hardware-only feedback. Do not claim that effects, usability, frame rate, or accessibility have been verified without relevant evidence. A static wireframe does not demonstrate motion behavior.

Attribution: Principles adapted from Emil Kowalski's apple-design skill (see THIRD-PARTY-NOTICES.txt for license). Reference consulted during authoring: Apple Designing Fluid Interfaces (WWDC 2018, session 803). These are static attributions only; agents must not fetch these URLs or treat their current content as authoritative over this document.
