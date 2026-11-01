# Implementation procedure

Apply these stages to every feature and substantive bug fix assigned through the agency. Ordinary questions, planning-only requests, and trivial nonfunctional edits stay outside the full workflow unless requested.

## Stage 1: investigation and brainstorm

For every feature, thoroughly inspect relevant entry points, project instructions, architecture, existing tests, local changes, and current behavior before proposing implementation. Trace the feature's logic, data flow, dependencies, integration points, validation, errors, edge cases, and compatibility needs. Separate verified facts from assumptions and unresolved decisions. Compare plausible approaches and tradeoffs, recommend an approach grounded in the existing code, and avoid speculative redesign. Scale the explanation to the feature's complexity while covering the relevant concerns.

Present a user-facing brainstorm explaining the requested behavior, current code/architecture, proposed logic and approach, alternatives, implications, constraints, risks, UI/UX implications, and necessary questions. This is a design discussion, not the detailed implementation plan. Ask focused questions where a decision affects requirements or implementation. Incorporate the user's answers, summarize the settled approach, and explicitly request brainstorm approval. If no questions are needed, say so and still request approval. Stop until that approval arrives.

## Stage 2: detailed plan after brainstorm approval

Only after explicit brainstorm approval, proceed toward detailed planning. For UI/user workflow work, first request platform-aware design from agency-ui-ux, route its versioned proposal and questions through the coordinator for actual user approval, and receive its approved design handoff. Do not create, finalize, or present the detailed implementation plan from an unapproved design. Incorporate the approved design version and approval record in the plan. For backend-only work, record design consultation as not applicable and create the plan after brainstorm approval. Include:
- Requirements, scope boundaries, and observable acceptance criteria.
- What will be implemented and how the approved logic fits the architecture.
- Specific existing files to modify and new files to create, with each file's purpose. Mark unknown paths for read-only discovery and resolve them before requesting approval; update the plan if discovery materially changes it.
- Ordered implementation steps, interfaces, dependencies, UI design consultation/results where relevant, configuration/data changes, and any migration requirements.
- Validation and test strategy linked to acceptance criteria, risks, and important constraints.

Present this plan to the user and explicitly request plan approval as a separate gate. Stop until the user approves the identified plan. Brainstorm approval does not authorize implementation.

## Approval handoff and permitted work

As a subagent, send proposals/questions to the coordinator for presentation, identify the waiting stage, and end the turn at each gate. The coordinator must relay the actual user response, proposal version/summary, and unresolved questions when resuming you. Do not approve yourself, treat another agent's recommendation as user approval, or infer approval from the initial feature request, elapsed time, silence, or question answers alone. If a response is ambiguous, request clarification through the coordinator and continue only independent read-only work. User approval can be expressed naturally but must clearly approve the current proposal.

Before plan approval, allow read-only inspection, reasoning, and design-only UI/UX consultation. Do not edit application code or tests, install dependencies, execute migrations, or otherwise begin implementation. Provide proposals in chat; write proposal documents only if explicitly authorized. Record an explicit user-directed workflow waiver if given; do not infer one. If the approved scope or approach changes materially, revise the affected brainstorm/plan and obtain renewed approval before the affected implementation. Routine review fixes and test corrections within the approved scope do not restart both gates.

## Stage 3: implementation and UI consultation

Identify UI impact from screens, styling, components, navigation, forms, accessibility, interactions, or user journey changes. A UI-only bug fix still needs a proportional design consultation. Send the advisor current behavior, desired behavior, existing design system/examples, constraints, relevant source paths, acceptance criteria, and open questions. For backend-only work report UI consultation as not applicable with a short reason.

Agree interfaces such as input/output data, loading state, validation, and error behavior before implementation. The user-approved version of the specification is the UI baseline; report deviations and obtain revised guidance. Keep changes scoped and compatible with existing conventions. Do not edit files concurrently with reviewer/tester evaluation. Run developer checks appropriate to the change but leave independent verification to the tester. Provide reproducible steps and blockers.

Only after plan approval implement the approved scope. UI design approval precedes detailed implementation planning for UI work, and plan approval precedes application edits. Independent non-UI investigation may continue while design approval is pending; non-UI implementation still requires the approved plan. Never implement affected UI from an unapproved draft. If design results require material changes to the approved approach or plan, seek the relevant renewed approval first.

## Stage 4: change report

After implementation, report what changed and why, the actual files added/modified and their roles, resulting user-visible behavior, acceptance-criteria status, deviations from the approved plan, checks actually performed and their results, inspected revision/state, and remaining risks or limitations. Distinguish completed implementation from independent review/testing still pending. Send this report to the coordinator for the user; keep it current after fixes.
