# AI Coding Agency

A multi-agent development ecosystem providing structured, reliable workflows with mandatory user approval gates, independent code reviews, real automated testing, and platform-aware UI/UX design.

---

## Supported Ecosystems & Tools

| Ecosystem        | Directory          | Status   | Description                                                                                                                        |
| ---------------- | ------------------ | -------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| **OpenAI Codex** | [`codex/`](codex/) | ✅ Ready | Complete multi-agent agency with 5 roles (`coordinator`, `developer`, `ui-ux`, `reviewer`, `tester`) and 2-gate approval workflow. |
| **Claude Code**  | [`claude/`](claude/) | ✅ Ready | Same agency as Claude Code subagents and skills: 5 roles, the same approval gates, per-role tool limits. |
| **GitHub Copilot** | [`copilot/`](copilot/) | ✅ Ready | Same agency as Copilot custom agents and Agent Skills for Copilot CLI and VS Code agent mode. |

---

## Codex Development Agency

For full details, setup instructions, workflows, and roles for OpenAI Codex, see the [Codex Documentation](codex/README.md).

### Quick Install (Codex)

Clone this repository and run the installer from the `codex/` directory:

**macOS / Linux**

```bash
git clone https://github.com/PRIME-SV/ai-coding-agency
cd ai-coding-agency/codex
bash install.sh
```

**Windows (PowerShell)**

```powershell
git clone https://github.com/PRIME-SV/ai-coding-agency
cd ai-coding-agency\codex
.\install.ps1
```

---

## Claude Code Development Agency

For full details, setup instructions, workflows, and roles for Claude Code, see the [Claude Code Documentation](claude/README.md).

### Quick Install (Claude Code)

Clone this repository and run the installer from the `claude/` directory:

**macOS / Linux**

```bash
git clone https://github.com/PRIME-SV/ai-coding-agency
cd ai-coding-agency/claude
bash install.sh
```

**Windows (PowerShell)**

```powershell
git clone https://github.com/PRIME-SV/ai-coding-agency
cd ai-coding-agency\claude
.\install.ps1
```

Then start a new Claude Code session. Run `/development-agency <task>`, or just ask for a feature and the global `CLAUDE.md` rule starts the agency.

---

## GitHub Copilot Development Agency

For full details, setup instructions, workflows, and roles for GitHub Copilot, see the [GitHub Copilot Documentation](copilot/README.md).

### Quick Install (GitHub Copilot)

Clone this repository and run the installer from the `copilot/` directory:

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

Then start a new Copilot CLI session (`copilot`). Run `/development-agency <task>`, or just ask for a feature and the global `copilot-instructions.md` rule starts the agency. To use it in VS Code or the Copilot cloud agent, copy it into a repository's `.github/` folder (see the [per-project install](copilot/README.md#per-project-install)).

---

## Core Philosophy

Traditional AI coding assistants often jump straight to writing code without exploring alternatives, fabricate test results, skip peer review, or introduce unapproved breaking changes.

This agency enforces an engineering-first workflow:

1. **Brainstorm Gate**: The AI explores existing code and alternatives, and presents questions. You must explicitly approve the approach before planning begins.
2. **UI/UX Gate** _(for UI tasks)_: Designs adapted for the target platform using fluid interaction principles, requiring user sign-off.
3. **Plan Gate**: File-level architecture and acceptance criteria must be explicitly approved before any code is modified.
4. **Independent Review + Review Gate**: A dedicated reviewer agent checks both the full diff and the whole codebase without permission to edit files. You approve the review and decide per finding: fix, accept, or defer.
5. **Real Test Execution**: A dedicated tester agent executes tests directly and provides reproducible command outputs.
6. **Structured Final Report**: Every run ends with a delivery report: approvals, acceptance criteria, changes, review decisions, test results, and limitations.

---

## Repository Structure

```
ai-coding-agency/
├── README.md                      # Main agency documentation
├── LICENSE                        # MIT License
├── codex/                         # OpenAI Codex agency bundle
│   ├── README.md                  # Codex-specific documentation
│   ├── AGENTS.md                  # Global rule configuration for Codex
│   ├── install.sh                 # Unix installation script
│   ├── install.ps1                # Windows PowerShell installation script
│   ├── THIRD-PARTY-NOTICES.txt    # Attribution notices
│   ├── agents/                    # Codex agent definitions (*.toml)
│   └── skills/                    # Specialized agent skills
├── claude/                        # Claude Code agency bundle
│   ├── README.md                  # Claude Code-specific documentation
│   ├── CLAUDE.md                  # Global rule block for Claude Code
│   ├── install.sh                 # Unix installation script
│   ├── install.ps1                # Windows PowerShell installation script
│   ├── THIRD-PARTY-NOTICES.txt    # Attribution notices
│   ├── agents/                    # Claude Code subagent definitions (*.md)
│   └── skills/                    # Specialized agent skills (shared with Codex)
├── copilot/                       # GitHub Copilot agency bundle
│   ├── README.md                  # Copilot-specific documentation
│   ├── copilot-instructions.md    # Global rule block for Copilot
│   ├── install.sh                 # Unix installation script
│   ├── install.ps1                # Windows PowerShell installation script
│   ├── THIRD-PARTY-NOTICES.txt    # Attribution notices
│   ├── agents/                    # Copilot custom agent definitions (*.agent.md)
│   └── skills/                    # Specialized agent skills (shared with Codex)
```

---

## Contributing

Contributions, feedback, and starter templates for `expectations.md` are welcome! Feel free to open issues or submit pull requests.

## License

MIT License — see [LICENSE](LICENSE).
