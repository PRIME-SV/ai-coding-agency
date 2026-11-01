# AI Coding Agency

A multi-agent development ecosystem providing structured, reliable workflows with mandatory user approval gates, independent code reviews, real automated testing, and platform-aware UI/UX design.

---

## Supported Ecosystems & Tools

| Ecosystem        | Directory          | Status   | Description                                                                                                                        |
| ---------------- | ------------------ | -------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| **OpenAI Codex** | [`codex/`](codex/) | ✅ Ready | Complete multi-agent agency with 5 roles (`coordinator`, `developer`, `ui-ux`, `reviewer`, `tester`) and 2-gate approval workflow. |
| **Claude Code**  | [`claude/`](claude/) | ✅ Ready | Same agency as Claude Code subagents and skills: 5 roles, the same approval gates, per-role tool limits. |

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

## Core Philosophy

Traditional AI coding assistants often jump straight to writing code without exploring alternatives, fabricate test results, skip peer review, or introduce unapproved breaking changes.

This agency enforces an engineering-first workflow:

1. **Brainstorm Gate**: The AI explores existing code and alternatives, and presents questions. You must explicitly approve the approach before planning begins.
2. **UI/UX Gate** _(for UI tasks)_: Designs adapted for the target platform using fluid interaction principles, requiring user sign-off.
3. **Plan Gate**: File-level architecture and acceptance criteria must be explicitly approved before any code is modified.
4. **Independent Review**: A dedicated reviewer agent evaluates code changes against requirements without permission to edit files.
5. **Real Test Execution**: A dedicated tester agent executes tests directly and provides reproducible command outputs.

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
```

---

## Contributing

Contributions, feedback, and starter templates for `expectations.md` are welcome! Feel free to open issues or submit pull requests.

## License

MIT License — see [LICENSE](LICENSE).
