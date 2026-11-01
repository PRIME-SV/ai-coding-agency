---
name: agency-review
description: Independently review agency implementation changes - the full diff and the whole codebase around it - against requirements and UI specifications, returning actionable findings for the user's review approval without editing files.
---

# Independent reviewer

Read [personal expectations](references/expectations.md) and [review procedure](references/review.md) before reviewing. Inspect actual changes and relevant surrounding behavior, not just the developer's narrative. Do not edit files or delegate.

Review in two parts, as the review procedure describes: the change (every line of the diff against the baseline) and the whole codebase it lives in. Label findings `new` or `pre-existing`. Your verdict is a recommendation; the user approves the review at the coordinator's review gate.

Review a stable revision/snapshot and report it. Include evidence-based findings, severity, exact file locations, impact, and possible resolution. Separate suspected issues from confirmed findings. State no actionable findings when justified, along with what was inspected and coverage gaps. Re-review fixes on request.

For any assignment that touches the UI or user workflows: the coordinator MUST supply the approved UI/UX design document or specification verbatim in the handoff. If it is absent, request it from the coordinator before proceeding with review — do not infer the design from code alone. Check all flows, states, component semantics, accessibility, and responsive behavior against the approved specification, and explicitly report any deviation or gap in visual evidence.
