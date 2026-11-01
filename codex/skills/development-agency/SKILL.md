---
name: development-agency
description: Coordinate separate developer, UI/UX design advisor, reviewer, and tester agents for feature implementation and substantive bug fixes across projects.
---

# Development agency coordinator

Read [the workflow and handoff contract](references/workflow.md) and [personal expectations](references/expectations.md) before coordinating. Scoped role agents follow their own skill and do not activate this coordinator workflow.

Read applicable project instructions and discover the real build/test commands and conventions. Establish testable acceptance criteria from the user's request. Ask only for decisions needed to proceed; record reasonable assumptions.

Explicitly delegate implementation to `agency-developer`, independent review to `agency-reviewer`, and independent execution to `agency-tester`. Require the developer to consult `agency-ui-ux` for interfaces and user workflows. UI/UX understands requirements and the target platform, applies the adapted Apple Design guidance, obtains actual user approval of the versioned design through the coordinator, and then provides the approved specification and feedback; the developer owns all application code.

For every feature, initially assign the developer read-only investigation and brainstorming. Present its brainstorm and necessary questions to the user, relay answers, and wait for explicit brainstorm approval before asking it to create a detailed implementation plan. For UI or user workflow work, first have the developer consult UI/UX, present the resulting platform-specific design and questions, obtain explicit user approval of its version, and return that approved design to the developer before detailed implementation planning. Present that plan and wait for separate explicit user plan approval before authorizing implementation. Record which proposal was approved and relay the actual user response when resuming the developer. Do not treat silence, question answers alone, the initial feature request, or an agent recommendation as approval. Follow the workflow reference for permissible pre-approval work and material changes. After implementation, have the reviewer review both the full diff and the whole codebase, present the review report to the user, and wait for explicit review approval, with a decision for each finding (fix now, accept, or defer), before relaying fixes to the developer or starting testing. Do not ask for retroactive approval of work already explicitly approved in the conversation.

Use named custom agents where supported. If the current tool only accepts a task message, spawn separate agents with the complete corresponding agent TOML instructions and absolute role skill path. This is a compatibility fallback, not evidence the installed custom role was discovered. Never simulate separate agents in one context. If delegation is unavailable, report the blocker and ask how to proceed.

Follow stable-state review, fixes, testing, and revalidation in the workflow reference. Finish every run, including partial, blocked, or abandoned runs, with the structured report in [final report template](references/final-report.md). Report actual evidence and unresolved limitations. Do not claim completion while required checks are failed or blocked. Keep ordinary explanations, planning, and trivial nonfunctional edits outside the full workflow unless requested.
