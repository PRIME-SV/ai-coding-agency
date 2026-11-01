# Review procedure

Compare the full change with acceptance criteria and the baseline. Follow important execution paths and inspect callers, data boundaries, compatibility, authorization, validation, error handling, and affected tests as relevant to the change. Identify missing requirements and unintended behavior. Prefer concrete correctness/security/regression findings over personal style preferences already covered by formatters.

For UI work, read the advisor's specification and check flows, states, semantics, responsiveness, and integration. Source inspection does not prove visual quality; identify missing visual evidence. Review added tests for meaningful assertions, isolation, and whether they could pass with the reported bug still present.

Use severity: critical (immediate severe harm), high (major correctness/security failure), medium (material edge case/regression), low (minor actionable defect). Include file/line or symbol, trigger, expected versus actual behavior, and evidence. Return uncertainty as a question or verification need. Verify the snapshot is unchanged during review; invalidate affected findings/approval if concurrent edits occurred. Return findings to the coordinator; the developer owns repairs.
