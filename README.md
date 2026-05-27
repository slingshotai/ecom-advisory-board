# eCom Advisory Board

An AI advisory board for ecommerce founders. Seven personas — **Jeff Bezos, Alex Hormozi, Steve Jobs, Warren Buffett, Andy Grove, Sam Walton, and Matt Edmundson** — provide strategic guidance, debate ideas, and pressure-test your thinking on ecommerce decisions.

Six legends bring world-class strategic frameworks. Matt brings the real-world operator lens — translating big strategy into Monday-morning actions for a founder with a small team and limited cash.

## What it does

You ask the board a strategic question. Claude picks 2-3 board members most relevant to the question, has them respond in character, surfaces tensions where they disagree, and summarises consensus + next steps. Sessions are saved so you can revisit them.

On first use, Claude asks a few short questions about your business (or you can point it at a doc you already have) and saves the answers. Every future session loads that context automatically, so the board's advice is grounded in *your* business — currency, scale, customer, and constraints — not generic playbook fluff.

## Install

Requires [Claude Code](https://claude.ai/code).

**One-liner (recommended):**

```bash
curl -fsSL https://raw.githubusercontent.com/slingshotai/ecom-advisory-board/main/install.sh | bash
```

Copies the skill to `~/.claude/skills/ecom-advisory-board/`. Restart Claude Code (or start a new session) and the board is available.

**Prefer to read the script first?**

```bash
curl -fsSL https://raw.githubusercontent.com/slingshotai/ecom-advisory-board/main/install.sh -o install.sh
less install.sh
bash install.sh
```

**From a clone:**

```bash
git clone https://github.com/slingshotai/ecom-advisory-board.git
cd ecom-advisory-board
bash install.sh
```

## Use

Talk to Claude naturally:

- *"run this past the board"*
- *"what would the board say about X?"*
- *"advisory board: should I drop my lowest-margin SKU?"*
- *"pressure-test this idea for me"*

## Commands

For more deliberate sessions, prefix your question with one of these:

| Command | What it does |
|---|---|
| `EVERYONE` | All seven board members respond |
| `DEBATE` | Members present conflicting views — shows genuine tension |
| `DEEP DIVE [name]` | One member gives extended analysis (4-6 paragraphs) |
| `DEVIL'S ADVOCATE` | 1-2 members argue why it could fail |
| `VOTE` | Each member gives a recommendation + short rationale |
| `QUICK TAKE` | Each member gives a 2-sentence read |
| `PAIR [name1] + [name2]` | Two members collaborate |

Example: `DEEP DIVE Buffett — should I pay £180k for a brand doing £400k/year?`

## Updating your business context

Say "update my business context" any time things change (new acquisition, new direction, change of focus). The board will re-run the onboarding and overwrite the saved file.

## Multiple brands

By default, your business context lives globally at `~/.claude/ecom-advisory-board/my-business.md` and works from any folder. If you run multiple brands, drop a `my-business.md` in the project folder for that brand — Claude uses the local file when present and falls back to the global one when not. Sessions are saved next to whichever context file was used.

## Where things live

- `~/.claude/skills/ecom-advisory-board/` — the skill itself
- `~/.claude/ecom-advisory-board/my-business.md` — your global business context (auto-created on first use)
- `~/.claude/ecom-advisory-board/sessions/` — saved board sessions
- `./my-business.md` and `./advisory-board-sessions/` — project-scoped overrides

## About

Built by Matt, host of the [eCommerce Podcast](https://ecommercepodcast.net) and creator of SAM, [Slingshot AI Mentor](https://www.auriondigital.com/slingshot).

A freebie from the SlingshotAI family of tools for ecommerce founders.
