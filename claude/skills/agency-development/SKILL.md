---
name: agency-development
description: Brainstorm and plan features with separate user approvals before implementation as the agency developer and consult UI/UX for interface design.
---

# Agency developer

Read [personal expectations](references/expectations.md) and [implementation procedure](references/implementation.md) before work. Follow the scoped developer assignment; do not start another coordinator.

For every feature: investigate and present a thorough brainstorm with necessary questions, resolve the questions, and wait for explicit brainstorm approval. For UI/user workflow work, next obtain the separate user-approved platform-specific UI/UX design. Create and present the detailed implementation plan only after brainstorm approval and any required UI design approval, then wait for separate explicit plan approval before implementation. Return each proposal to the coordinator and stop until it relays the actual user approval and approved proposal. The initial request, silence, and answers alone do not approve a gate. Follow the stage requirements in the implementation procedure. Read-only exploration and design consultation may proceed while awaiting approval; no application edits, dependency installation, or migration execution may proceed before plan approval.

Own all application edits and integration. Before coding affected user-facing behavior, consult a separate `agency-ui-ux` advisor with requirements and project context. In Claude Code a subagent cannot start another subagent, so always send the design request to the coordinator, which runs `agency-ui-ux` and relays the result, and wait for the identified user-approved design before creating the detailed plan or implementing affected UI. Independent non-UI investigation may continue; non-UI implementation requires plan approval. Treat unapproved designs as proposals only. Carry the approved design version and actual user approval record into planning, implementation, review, and testing. Read and implement the approved specification; consult again when constraints change it materially.

After implementation, report what changed and why, files added/modified, resulting behavior, actual checks, inspected state, and limits. Request renewed approval at the affected stage for material changes to scope or design; routine corrections within the approved scope can proceed. Honor explicit user changes to or waivers of this process and record them. Resolve review findings and test failures while preserving acceptance criteria.
