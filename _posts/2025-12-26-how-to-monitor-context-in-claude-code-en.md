---
layout: post
title: How to Always See Context Percentage in Claude Code
categories:
  - GenAI
  - LLMs
  - AI-Guided Development
tags:
  - GenAI
  - LLMs
  - AI-Guided Development
  - Claude Code
  - Context Engineering
lang: en
ref: como-tener-siempre-visible-el-porcentaje-de-contexto-en-claude-code
published: true
---

> "You can't manage what you can't measure" - Peter Drucker

Claude Code lets you customize a "status line" that updates after each command. [Status line configuration](https://code.claude.com/docs/en/statusline)

I run the `/context` command all the time. If you don't know why you need to watch your context, read my article [Your CLAUDE.md Doesn't Work (without Context Engineering)]({{ site.baseurl }}/2025/11/13/your-claude-md-does-not-work-without-context-engineering-en.html)

The `/context` command is slow and breaks my workflow, so I created a status line to see context status in real-time.

**Green** (<40%)

<img src="{{ site.baseurl }}/images/2025-12-26-controla-el-llenado-del-contexto-de-claude-code-es/context-status-line-green.png" alt="Green status bar - context under 40%" style="max-height:400px; width:auto; height:auto;"/>

**Yellow** (40-60%)

<img src="{{ site.baseurl }}/images/2025-12-26-controla-el-llenado-del-contexto-de-claude-code-es/context-status-line-yellow.png" alt="Yellow status bar - context between 40% and 60%" style="max-height:400px; width:auto; height:auto;"/>

**Red** (>60%). With warning ⚠️ at 70% because you are close to auto-compact, if you have it enabled.

<img src="{{ site.baseurl }}/images/2025-12-26-controla-el-llenado-del-contexto-de-claude-code-es/context-status-line-red.png" alt="Red status bar - context over 60% with warning" style="max-height:400px; width:auto; height:auto;"/>

## Installation

### 1. Install jq (JSON processor)

```bash
# macOS
brew install jq

# Linux (Ubuntu/Debian)
sudo apt-get install jq
```

### 2. Download the script

```bash
mkdir -p ~/.claude
curl -o ~/.claude/statusline.sh https://raw.githubusercontent.com/nikeyes/claude-code-config/main/statusline.sh
chmod +x ~/.claude/statusline.sh
```

### 3. Configure Claude Code

Add this configuration to the `~/.claude/settings.json` file

```json
{
  "statusLine": {
    "type": "command",
    "command": "~/.claude/statusline.sh",
    "padding": 0
  }
}
```

Example: [https://github.com/nikeyes/claude-code-config/blob/main/settings-personal.json#L14](https://github.com/nikeyes/claude-code-config/blob/main/settings-personal.json#L14)

### 4. Restart Claude Code

Done. Now you can see your context percentage at all times.

<img src="{{ site.baseurl }}/images/2025-12-26-controla-el-llenado-del-contexto-de-claude-code-es/context-status-line-complete.png" alt="Claude Code with context status line" style="max-height:400px; width:auto; height:auto;"/>

## Note about auto-compact

**I have context auto-compact disabled.** If you have it enabled, Claude Code reserves 22.5% of context for compacting. So when you reach **77% context, it will auto-compact**.

I use the [stepwise-dev](https://github.com/nikeyes/stepwise-dev) plugin and never compact. I control context at each step and clear the entire context in each phase: Research → Plan → Implement Phase X → Validate.
