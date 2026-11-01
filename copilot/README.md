# GitHub Copilot Development Agency

A structured, multi-agent development workflow for [GitHub Copilot](https://github.com/features/copilot) (Copilot CLI and VS Code agent mode) that enforces **brainstorm → plan → implement → review → test** with mandatory user approval gates at every stage.

It is the Copilot edition of the [Codex Development Agency](../codex/README.md) (also available for [Claude Code](../claude/README.md)): same roles, same gates, same skills, packaged as Copilot custom agents and Agent Skills.

> No more agents that ship code without asking. No more one-shot implementations that skip review. No more tests that never actually run.

---

## The Problem

Out of the box, an AI coding agent will:
- Jump straight to implementation without exploring the problem space
- Skip independent code review (the same agent can't review its own work)
- Claim tests pass without executing them
- Ship UI changes with no design process
- Never ask for your approval before making large changes

## The Solution

This agency adds **four independent roles** orchestrated by a coordinator:

```
You
 │
 ▼
Coordinator (main Copilot chat — development-agency skill)
 │
 ├─► Developer (agency-developer)
 │     ├─► [Brainstorm] ──── awaits your approval ──►
 │     ├─► [Design request → coordinator]
 │     ├─► [Implementation Plan] ── awaits your approval ──►
 │     └─► [Implementation + change report]
 │
 ├─► UI/UX Advisor (agency-ui-ux)   ← run by the coordinator for the developer
 │     └─► Versioned design draft ──── awaits your approval ──►
 │
 ├─► Reviewer (agency-reviewer)
 │     └─► Independent evidence-based findings (no edit tools)
 │
 └─► Tester (agency-tester)
       └─► Real test execution with reproducible evidence (cannot edit app code)
```

### Without this agency vs. with it

| | Without | With this agency |
|---|---|---|
| **Approval gates** | None — agent self-approves | Brainstorm, Plan, and Review, each requiring your explicit OK |
| **UI changes** | Ad-hoc, inconsistent | Platform-aware Apple Design principles, user-approved before implementation |
| **Code review** | Same agent reviews its own work | Separate reviewer subagent, evidence-based, has no edit tools |
| **Test execution** | Often fabricated or skipped | Independent tester, reports exact commands + exit codes |
| **Rollback** | Undefined | Explicit abandonment policy — coordinator confirms before reverting |
| **Scope creep** | Common | Material changes require re-approval at the affected gate |

---

## Roles

| Role | Custom agent | Skill | Tools | Responsibilities |
|---|---|---|---|---|
| **Coordinator** | *(main chat)* | `development-agency` | all | Orchestrates all other roles; presents proposals and relays your approval |
| **Developer** | `agency-developer` | `agency-development` | `read`, `edit`, `search`, `execute`, `web` | Investigates, brainstorms, plans, implements, reports |
| **UI/UX Advisor** | `agency-ui-ux` | `agency-ui-ux` | `read`, `search`, `edit` (assigned design paths only) | Designs using adapted Apple Design principles; never writes app code |
| **Reviewer** | `agency-reviewer` | `agency-review` | `read`, `search`, `execute` (read-only commands) | Independently reviews implementation; cannot edit files |
| **Tester** | `agency-tester` | `agency-testing` | `read`, `search`, `execute`, `edit` (assigned test files only) | Executes tests and reports evidence; cannot modify app code |

The `tools` list in each agent file enforces part of each role's limits; for example, the reviewer has no `edit` tool. The skill instructions cover the rest.

---

## Quick Install

**macOS / Linux**
```bash
git clone https://github.com/PRIME-SV/ai-coding-agency
cd ai-coding-agency/copilot
bash install.sh
```

**Windows (PowerShell)**
```powershell
git clone https://github.com/PRIME-SV/ai-coding-agency
cd ai-coding-agency\copilot
.\install.ps1
```

Then **start a new Copilot CLI session** (`copilot`). The agency activates automatically via `~/.copilot/copilot-instructions.md` for every future session. You can also start it directly with `/development-agency <task>`, and pick a single role with `/agent`.

The installers respect `COPILOT_HOME` if you have set it; otherwise they install into `~/.copilot`.

VS Code also reads custom agents from `~/.copilot/agents` and skills from `~/.copilot/skills`. For the always-on rule in VS Code, use the per-project install below (`.github/copilot-instructions.md`).

### Manual install
If you prefer to install manually:
1. Copy everything in `skills/` into `~/.copilot/skills/`
2. Copy everything in `agents/` into `~/.copilot/agents/`
3. Append the contents of `copilot-instructions.md` into your existing `~/.copilot/copilot-instructions.md` (keep it between the `<!-- copilot-development-agency:begin -->` and `<!-- copilot-development-agency:end -->` markers)

### Per-project install
To use the agency in a single repository only (this also works for Copilot in VS Code and the Copilot cloud agent), copy `agents/` to `<project>/.github/agents/`, `skills/` to `<project>/.github/skills/`, and the rule block into `<project>/.github/copilot-instructions.md`. Repository agents take precedence over personal ones with the same name.

---

## How It Works

### Approval gates (strictly enforced)

The agency enforces **two separate approval gates** for every feature:

1. **Brainstorm approval** — developer investigates existing code, proposes approach with tradeoffs and questions. You approve before any planning begins.
2. **Plan approval** — detailed file-level implementation plan with acceptance criteria. You approve before any code is written.

Neither silence, question answers, nor the initial request counts as approval. The coordinator will always ask explicitly.

For UI/user workflow changes, there is a **third gate**:

3. **Design approval** — UI/UX advisor produces a versioned, annotated wireframe or state table. You approve before the developer writes any UI code.

After implementation, there is a **review gate**:

4. **Review approval** — the reviewer checks both the full diff (every changed line) and the whole codebase around it, and labels each finding `new` or `pre-existing`. You decide per finding: fix now, accept, or defer. Fixes and testing start only after you approve the review.

Every run ends with a **structured final report**: summary, approvals record, acceptance criteria, changed files, review findings and decisions, test results, deviations, limitations, and how to verify. See [`final-report.md`](skills/development-agency/references/final-report.md).

### Workflow stages

```
Stage 1: Investigation & Brainstorm
  └─► Developer inspects code, proposes approach, asks questions
  └─► YOU APPROVE

Stage 2: UI/UX Design (if UI work)
  └─► Coordinator runs the UI/UX advisor for the developer's design request
  └─► UI/UX advisor designs for your actual platform
  └─► YOU APPROVE the versioned design

Stage 2b: Detailed Implementation Plan
  └─► Developer writes file-level plan with acceptance criteria
  └─► YOU APPROVE

Stage 3: Implementation
  └─► Developer implements only the approved scope
  └─► Change report returned to coordinator

Stage 4: Independent Review
  └─► Reviewer checks the full diff AND the whole codebase
  └─► YOU APPROVE the review: fix / accept / defer each finding
  └─► Approved fixes go to the developer, then re-review

Stage 5: Independent Testing
  └─► Tester executes real tests, reports exact commands & results
  └─► Failures returned to developer; retest after fixes

Stage 6: Final Report
  └─► Coordinator delivers the structured delivery report
```

### What each role cannot do

| Role | Cannot |
|---|---|
| UI/UX Advisor | Edit application code, create runnable prototypes, delegate |
| Reviewer | Edit any file, approve changes, delegate |
| Tester | Modify application code, weaken assertions to get green, fabricate test results |
| Any role | Restart the coordinator workflow or self-approve a gate |

---

## Differences from the other editions

| | Codex | Claude Code | GitHub Copilot |
|---|---|---|---|
| Agent definitions | `agents/*.toml` | `agents/*.md` | `agents/*.agent.md` (YAML frontmatter + prompt) |
| Global rule file | `~/.codex/AGENTS.md` | `~/.claude/CLAUDE.md` | `~/.copilot/copilot-instructions.md` |
| Install location | `~/.codex` (`CODEX_HOME`) | `~/.claude` (`CLAUDE_CONFIG_DIR`) | `~/.copilot` (`COPILOT_HOME`) |
| UI/UX consultation | Developer may spawn UI/UX itself | Coordinator runs UI/UX | Coordinator runs UI/UX |
| Role limits | Instructions | Instructions + `tools` allowlist | Instructions + `tools` aliases (`read`, `edit`, `search`, `execute`, `web`) |

The skills (`skills/`) and their references are shared with the other editions. Only the delegation wording was adapted.

---

## Customizing Your Standards

The `expectations.md` file in each role's `references/` directory is where you put your personal standards. They are **mandatory reading** for each role before it does any work.

| File | What to add |
|---|---|
| [`skills/agency-development/references/expectations.md`](skills/agency-development/references/expectations.md) | Coding standards, error handling rules, commit format, forbidden patterns |
| [`skills/agency-review/references/expectations.md`](skills/agency-review/references/expectations.md) | Severity classification, what counts as blocking, required security checks |
| [`skills/agency-testing/references/expectations.md`](skills/agency-testing/references/expectations.md) | Coverage thresholds, evidence requirements, required edge cases |
| [`skills/agency-ui-ux/references/expectations.md`](skills/agency-ui-ux/references/expectations.md) | Brand colors, design tokens, target platforms, component libraries |
| [`skills/development-agency/references/expectations.md`](skills/development-agency/references/expectations.md) | Coordinator preferences, scope rules, communication style |

To change a role's model or tools, edit the frontmatter of its file in `agents/`. For example, add a `model:` line to the reviewer to run it on a cheaper model.

### Adding project-specific rules
For per-project configuration, add `.github/copilot-instructions.md` (or `AGENTS.md`) to your project. Project instructions are read by all roles and take precedence over global defaults for that project.

---

## Design Principles

### UI/UX: Adapted Apple Design
The UI/UX advisor applies principles from Apple's Human Interface Guidelines — **adapted to your actual target platform**, not imposed as iOS chrome everywhere:

- Immediate press feedback; actions commit on release
- Gesture continuity with momentum and sensible snap destinations
- Transitions that are spatially anchored and reversible
- Accessible alternatives for every gesture or motion pattern
- Reduced motion, reduced transparency, and text scaling respected

These principles are fully inlined in [`skills/agency-ui-ux/references/apple-design.md`](skills/agency-ui-ux/references/apple-design.md) — the agency does not depend on any external URL.

### State tracking
For Git projects the agency records base commit, HEAD, and content hashes of changed files. A review or test result is only valid for the exact snapshot it was run against. After any edit, affected review and tests are automatically re-run.

### Rollback policy
If you abandon a feature mid-implementation, the coordinator will ask whether to revert, branch, or leave changes in place — and will not touch your work until you answer.

---

## Resource limits

- Maximum **3 active subagents** at once alongside the coordinator
- Maximum **3 review/test correction cycles** per feature (configurable)
- Developer is reused across fix iterations; review and UI/UX agents are released when no longer needed

---

## Compatibility

Built for **GitHub Copilot CLI** and **Copilot agent mode in VS Code**. Agents follow the Copilot custom agent format (`*.agent.md`), and skills follow the Agent Skills format (`skills/<name>/SKILL.md`). Agents and skills installed during a session are picked up when a new session starts. Copilot features used here are still evolving; check the [custom agents reference](https://docs.github.com/en/copilot/reference/custom-agents-configuration) if a field stops working.

---

## Contributing

1. Fork and clone
2. Make changes in a branch
3. Open a PR — include what problem it fixes and what files changed
4. Keep `skills/` in step with the Codex and Claude Code editions where the change is not tool-specific
5. Suggestions for `expectations.md` starter templates are especially welcome

---

## License

MIT — see [LICENSE](LICENSE).  
Third-party attribution for UI/UX principles: see [THIRD-PARTY-NOTICES.txt](THIRD-PARTY-NOTICES.txt).
