# Final delivery report

Mandatory. At the end of every agency run (completed, partial, blocked, or abandoned), the coordinator delivers this report to the user in chat. Write it to a file only if the user or project instructions ask for one. Use the headings below in this order. Fill every section; write "None" or "Not applicable" with a short reason instead of deleting a section. Report only what actually happened and cite evidence; never invent a pass, an approval, or a check.

## Template

```markdown
# Delivery report: <feature name>

**Status:** Complete | Partial | Blocked | Abandoned
**Project:** <repository or path>  **Date:** <YYYY-MM-DD>
**Baseline:** <base commit or snapshot>  **Final state:** <HEAD + content-hash snapshot>

## 1. Summary
Two to four sentences: what was asked, what was delivered, and whether it is ready to use.

## 2. Approvals
| Gate | Proposal / version | User response (quoted or summarized) | When |
|---|---|---|---|
| Brainstorm | | | |
| UI/UX design | | | |
| Plan | | | |
| Review | | | |
Record waivers and re-approvals after material changes as their own rows.

## 3. Requirements and acceptance criteria
| # | Acceptance criterion | Status (met / not met / partial) | Evidence |
|---|---|---|---|

## 4. Changes
| File | Added / modified / deleted | Purpose |
|---|---|---|
Note dependencies, migrations, configuration, or environment changes separately.

## 5. Design (UI work only)
Approved design version, deviations found during review or testing, and visual evidence or the lack of it.

## 6. Review
- **Reviewed snapshot:** <state>
- **Reviewer verdict (recommendation):** approve | approve with comments | changes requested
- **Change review (diff):** files reviewed, coverage gaps.
- **Codebase review:** areas inspected, areas not inspected.

| ID | Severity | Scope (new / pre-existing) | Location | Finding | User decision (fix / accept / defer) | Outcome |
|---|---|---|---|---|---|---|

## 7. Testing
| Command or action | Result (exit code / pass-fail counts) | Covers criteria |
|---|---|---|
Skipped or blocked checks, with reasons.

## 8. Fix cycles
Number of review/test correction cycles used (of the budget), and what each fixed.

## 9. Deviations from the approved plan
Each deviation, why it happened, and whether the user approved it.

## 10. Known limitations and follow-ups
Open issues, deferred and pre-existing findings, coverage gaps, and recommended next steps.

## 11. How to verify
Exact commands or steps the user can run to see the result.
```

## Rules
- The report covers the final applicable state only. If edits happened after the last review or test, say so and mark those results stale.
- Status is `Complete` only when the completion requirements in the workflow are met. Otherwise use `Partial`, `Blocked`, or `Abandoned` and say what is missing.
- Keep findings and approvals traceable: use the same finding IDs and proposal versions used during the run.
