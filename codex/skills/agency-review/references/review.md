# Review procedure

## Review scope: the change and the whole codebase
Every review has two parts. Report them separately.

1. **Change review (diff).** Review every added, modified, and deleted line between the recorded baseline and the current snapshot, including relevant untracked files. List the files reviewed. Do not skip any part of the diff; if generated, vendored, or lock files are skipped, name them and say why.
2. **Codebase review (whole project).** Review the whole codebase the change lives in, not only the touched files: architecture and module boundaries, how the new code fits existing patterns and conventions, callers and dependents of changed code, shared utilities, configuration, security-sensitive areas (authentication, authorization, input handling, secrets, dependencies), test coverage, and existing defects. For large codebases, prioritize areas connected to the change and high-risk areas, then state exactly which directories or files were inspected and which were not. Never claim coverage you did not do.

Label every finding `new` (introduced or exposed by the change) or `pre-existing` (present before the change). New findings of medium severity or higher block completion unless the user accepts them. Pre-existing findings are reported for the user's decision and do not block the feature unless the change depends on them or makes them worse.

## Procedure
Compare the full change with acceptance criteria and the baseline. Follow important execution paths and inspect callers, data boundaries, compatibility, authorization, validation, error handling, and affected tests as relevant to the change. Identify missing requirements and unintended behavior. Prefer concrete correctness/security/regression findings over personal style preferences already covered by formatters.

For UI work, read the advisor's specification and check flows, states, semantics, responsiveness, and integration. Source inspection does not prove visual quality; identify missing visual evidence. Review added tests for meaningful assertions, isolation, and whether they could pass with the reported bug still present.

Use severity: critical (immediate severe harm), high (major correctness/security failure), medium (material edge case/regression), low (minor actionable defect). Include file/line or symbol, trigger, expected versus actual behavior, and evidence. Return uncertainty as a question or verification need. Verify the snapshot is unchanged during review; invalidate affected findings/approval if concurrent edits occurred. Return findings to the coordinator; the developer owns repairs.

## Review report format
Return to the coordinator, who presents it to the user at the review approval gate:
- Reviewed snapshot: base, HEAD, and content hashes; confirm it did not change during review.
- Verdict: `approve`, `approve with comments`, or `changes requested`. This is a recommendation only; the user approves the review.
- Change review: files reviewed and any skipped, with findings.
- Codebase review: areas inspected and not inspected, with findings.
- Each finding: ID (R1, R2, ...), severity, scope (`new` or `pre-existing`), location, trigger and evidence, impact, proposed resolution, and a suggested default decision (fix now, accept, or defer).
- Coverage gaps and open questions.

On re-review, keep the same finding IDs, mark each as resolved, still open, or regressed, and review the diff since the last reviewed snapshot plus affected areas.
