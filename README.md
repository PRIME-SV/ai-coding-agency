# Codex Development Agency

A structured, multi-agent development workflow for [OpenAI Codex](https://openai.com/codex) that enforces **brainstorm → plan → implement → review → test** with mandatory user approval gates at every stage.

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
Coordinator (main chat — development-agency skill)
 │
 ├─► Developer (agency-developer)
 │     ├─► [Brainstorm] ──── awaits your approval ──►
 │     ├─► [UI/UX consult if needed]
 │     ├─► [Implementation Plan] ── awaits your approval ──►
 │     └─► [Implementation + change report]
 │
 ├─► UI/UX Advisor (agency-ui-ux)
 │     └─► Versioned design draft ──── awaits your approval ──►
 │
 ├─► Reviewer (agency-reviewer)
 │     └─► Independent evidence-based findings (cannot edit files)
 │
 └─► Tester (agency-tester)
       └─► Real test execution with reproducible evidence (cannot edit app code)
```

### Without this agency vs. with it

| | Without | With this agency |
|---|---|---|
| **Approval gates** | None — agent self-approves | Brainstorm + Plan, both requiring your explicit OK |
| **UI changes** | Ad-hoc, inconsistent | Platform-aware Apple Design principles, user-approved before implementation |
| **Code review** | Same agent reviews its own work | Separate reviewer agent, evidence-based, cannot edit files |
| **Test execution** | Often fabricated or skipped | Independent tester, reports exact commands + exit codes |
| **Rollback** | Undefined | Explicit abandonment policy — coordinator confirms before reverting |
| **Scope creep** | Common | Material changes require re-approval at the affected gate |

---

## Roles

| Role | Agent TOML | Skill | Responsibilities |
|---|---|---|---|
| **Coordinator** | *(main chat)* | `development-agency` | Orchestrates all other roles; presents proposals and relays your approval |
| **Developer** | `agency-developer` | `agency-development` | Investigates, brainstorms, plans, implements, reports |
| **UI/UX Advisor** | `agency-ui-ux` | `agency-ui-ux` | Designs using adapted Apple Design principles; never writes app code |
| **Reviewer** | `agency-reviewer` | `agency-review` | Independently reviews implementation; cannot edit files |
| **Tester** | `agency-tester` | `agency-testing` | Executes tests and reports evidence; cannot modify app code |

---

## Quick Install

**macOS / Linux**
```bash
git clone https://github.com/YOUR_USERNAME/codex-development-agency
cd codex-development-agency
bash install.sh
```

**Windows (PowerShell)**
```powershell
git clone https://github.com/YOUR_USERNAME/codex-development-agency
cd codex-development-agency
.\install.ps1
```

Then **restart Codex**. The agency activates automatically via `AGENTS.md` for every future session.

### Manual install
If you prefer to install manually:
1. Copy everything in `skills/` into `~/.codex/skills/`
2. Copy everything in `agents/` into `~/.codex/agents/`
3. Append the contents of `AGENTS.md` into your existing `~/.codex/AGENTS.md` (keep it between the `<!-- codex-development-agency:begin -->` and `<!-- codex-development-agency:end -->` markers)

---

## How It Works

### Approval gates (strictly enforced)

The agency enforces **two separate approval gates** for every feature:

1. **Brainstorm approval** — developer investigates existing code, proposes approach with tradeoffs and questions. You approve before any planning begins.
2. **Plan approval** — detailed file-level implementation plan with acceptance criteria. You approve before any code is written.

Neither silence, question answers, nor the initial request counts as approval. The coordinator will always ask explicitly.

For UI/user workflow changes, there is a **third gate**:

3. **Design approval** — UI/UX advisor produces a versioned, annotated wireframe or state table. You approve before the developer writes any UI code.

### Workflow stages

```
Stage 1: Investigation & Brainstorm
  └─► Developer inspects code, proposes approach, asks questions
  └─► YOU APPROVE

Stage 2: UI/UX Design (if UI work)
  └─► UI/UX advisor designs for your actual platform
  └─► YOU APPROVE the versioned design

Stage 2b: Detailed Implementation Plan
  └─► Developer writes file-level plan with acceptance criteria
  └─► YOU APPROVE

Stage 3: Implementation
  └─► Developer implements only the approved scope
  └─► Change report returned to coordinator

Stage 4: Independent Review
  └─► Reviewer inspects code against requirements & approved design
  └─► Findings returned to developer for fixes

Stage 5: Independent Testing
  └─► Tester executes real tests, reports exact commands & results
  └─► Failures returned to developer; retest after fixes
```

### What each role cannot do

| Role | Cannot |
|---|---|
| UI/UX Advisor | Edit application code, create runnable prototypes, delegate |
| Reviewer | Edit any file, approve changes, delegate |
| Tester | Modify application code, weaken assertions to get green, fabricate test results |
| Any role | Restart the coordinator workflow or self-approve a gate |

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

### Adding project-specific rules
For per-project configuration, add an `AGENTS.md` to your project's root directory. Project instructions are read by all roles and take precedence over global defaults for that project.

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

Tested with **OpenAI Codex** (`~/.codex`). The TOML agent format and skill discovery path follow the Codex custom-agent spec. The `AGENTS.md` global rule is standard across Codex versions.

---

## Contributing

1. Fork and clone
2. Make changes in a branch
3. Open a PR — include what problem it fixes and what files changed
4. Suggestions for `expectations.md` starter templates are especially welcome

---

## License

MIT — see [LICENSE](LICENSE).  
Third-party attribution for UI/UX principles: see [THIRD-PARTY-NOTICES.txt](THIRD-PARTY-NOTICES.txt).
