---
layout: post
title: Your CLAUDE.md Doesn't Work (Without Context Engineering)
categories:
  - GenAI
  - LLMs
  - AI-Driven Development
tags:
  - GenAI
  - LLMs
  - AI-Driven Development
  - Claude Code
  - Context Engineering
lang: en
ref: tu-claude-md-no-funciona-sin-context-engineering
published: true
---

> "Context engineering over prompt engineering" - Andrej Karpathy

You've watched all the Claude Code tutorials.
You've created your shiny `CLAUDE.md` with good architecture and design rules. Time to code!

But after Claude Code makes changes for a while, it starts forgetting your rules and no longer develops as you need.

**The problem isn't your rules. The problem is you're not controlling the context.**

## Why Having a CLAUDE.md Isn't Enough

My [CLAUDE.md](https://github.com/nikeyes/claude-code-config/blob/main/CLAUDE.md) defines clear and solid principles. But there's a problem: The best rules in the world don't work if Claude Code has **too much context**.

## What matters isn't context windows, it's attention windows

LLM manufacturers announce huge context windows. Claude 3.5 Sonnet accepts 200k tokens. Gemini 1 million. Sounds impressive.

But you need to differentiate between **how much context they accept** (the context window) and **how much context they can effectively process** (the attention window).

### Context window vs attention window

Manufacturers don't publish information about their attention windows to avoid revealing implementation details of their architectures.
But the community has tried to find the attention window size empirically. Testing, testing, and testing.
All these tests demonstrate that the attention window is smaller than the context window.

| **Model**    | **Context Window** | **Attention Window**       | **Source**                   |
|--------------|-------------------|----------------------------|------------------------------|
| GPT-4 Turbo  | 128k tokens       | ~64k tokens (50%)          | [RULER Benchmark](https://ar5iv.labs.arxiv.org/html/2404.06654)  |
| Claude 3/3.5 | 200k tokens       | No data found              | [Anthropic: "LLMs lose focus with long contexts"](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) |
| LLaMA 3.1    | 128k tokens       | ~32k tokens (25%)          | [Databricks RAG Evaluations](https://www.databricks.com/blog/long-context-rag-performance-llms) |
| Mistral 7B   | 32k tokens        | ~16k effective (50%)       | [RULER Benchmark](https://ar5iv.labs.arxiv.org/html/2404.06654)              |

**Tests show that after 50-60% of the context window, accuracy drops 20-50% depending on the model.**

After several months working with Claude Code, my typical workflow was:
- **Half an hour of spectacular productivity**, Claude works flawlessly following my `CLAUDE.md`
- **45 minutes later**: "Claude, not like that, remember your `CLAUDE.md`". But it starts ignoring my design rules and project context: Why is it creating a new service if I asked it to use the existing one? Why hasn't it implemented tests?
- **1 hour later**: Claude Code will automatically compact the context. Will I stay above 60%? Do I `/clear` and explain everything again? Do I continue like this and risk it continuing to ignore my rules?
- **2 weeks later**: "Where did I save that authentication research from last week?" -> I have to ask for it again from scratch.

This is my Claude Code context in a new, clean session. It starts at 32% 😱:

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/01_free_context.png" alt="Claude Code context in new session at 32%" style="max-height:400px; width:auto; height:auto;"/>

Then I found the "Frequent Intentional Compaction" (FIC) framework developed by [Dex Horthy](https://x.com/dexhorthy/) and [HumanLayer](https://github.com/humanlayer/humanlayer). This framework proposes a structured workflow in phases (Research -> Plan -> Implement -> Validate) to keep context controlled.
I created the [stepwise-dev](https://github.com/nikeyes/stepwise-dev) plugin to automate and implement this FIC workflow in Claude Code, keeping context below 60% systematically.

## The FIC Framework (Frequent Intentional Compaction)

As [Dex Horthy explains in his talk about Context Engineering](https://www.youtube.com/watch?v=VvkhYWFWaKI), the context problem is solved with a structured workflow:

> "The key is to separate research, planning, and implementation into distinct phases with frequent intentional compaction."

The FIC framework proposes 4 independent phases:
- **Research**: Investigation without implementation
- **Plan**: Iterative design before code
- **Implement**: Execution by phases
- **Validate**: Systematic verification

Between each phase, intentional context cleanup (`/clear`) is done, but knowledge persists in structured files.

**Stepwise-dev automates this FIC workflow**, providing specific commands for each phase and automatically managing knowledge persistence in the `thoughts/` directory.

## How does stepwise-dev implement the FIC framework?

The solution isn't writing better prompts. It's structuring your workflow to keep context controlled.

`Stepwise-dev` implements the 4 FIC phases through specific commands. Each phase starts with clean context.

### Research: Investigate without implementing (/stepwise-dev:research_codebase)

The problem: you ask Claude "investigate how X works". Claude loads 30 files, analyzes everything, and you end up with 65% context filled with information you no longer need.

```bash
/stepwise-dev:research_codebase "How does authentication work in this project?"
/clear
```

`stepwise-dev` launches up to **5 specialized agents in parallel** (codebase-locator, codebase-analyzer, pattern-finder...) and generates a document in `thoughts/shared/research/`.

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/02_research_agents.png" alt="5 specialized agents running in parallel during research" style="max-height:400px; width:auto; height:auto;"/>

When `stepwise-dev` finishes the research, it guides you on the next steps (the other commands do this too).

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/03_research_output.png" alt="Next steps guide after completing research" style="max-height:400px; width:auto; height:auto;"/>


This is my context after conducting research in a folder with 7 projects that interact with each other but are implemented with different technologies (Astro, Java, Python):

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/04_research_context_after.png" alt="Claude Code context after research in project with 7 technologies" style="max-height:400px; width:auto; height:auto;"/>

After `/clear`, persistent knowledge. Clean context.

### Plan: Design before implementing (/stepwise-dev:create_plan)

As [Dex Horthy](https://x.com/dexhorthy/) says in [Context Engineering SF: Advanced Context Engineering for Agents](https://www.youtube.com/watch?v=VvkhYWFWaKI):

> "A bad line of code is... a bad line of code. But a bad line of a plan could lead to hundreds of bad lines of code."

Reviewing 200 lines of plan is easier than reviewing 2000 lines of code.

```bash
/stepwise-dev:create_plan @thoughts/shared/research/2025-11-15-auth.md Add authentication between services
/clear

# Optional: iterate the plan
/stepwise-dev:iterate_plan @thoughts/shared/plans/2025-11-15-auth.md Add support for token refresh and expiration handling
/clear
```
Claude creates a structured plan in phases. You iterate as many times as you want until the plan is solid.

Remember that I launched `/create_plan` in a folder with 7 projects that interact with each other but are implemented with different technologies (Astro, Java, Python):

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/05_plan_context_after.png" alt="Claude Code context after creating the plan" style="max-height:400px; width:auto; height:auto;"/>

### Implement: Implement phases one at a time (/stepwise-dev:implement_plan)

`Stepwise-dev` allows you to implement the complete plan. The problem is that the context will likely grow beyond 60%.

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/07_plan_context_implement_all_fases.png" alt="Claude Code context when implementing all phases, exceeding 60%" style="max-height:400px; width:auto; height:auto;"/>

That's why it's important to execute it in phases:

```bash
/stepwise-dev:implement_plan @thoughts/shared/plans/2025-11-15-oauth.md Phase 1 only
/clear
```

Claude Code reads the complete plan, implements **only ONE phase**, runs tests, and waits for your confirmation.

```bash
/stepwise-dev:implement_plan @thoughts/shared/plans/2025-11-15-oauth.md Phase 2 only
/clear
```

**Result:** Context never exceeds 60% in small/medium projects and stays very close to 60% in large projects. The code is coherent because each phase has clean context.

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/06_Plan_context_implement_fase_1.png" alt="Claude Code context when implementing only phase 1, staying controlled" style="max-height:400px; width:auto; height:auto;"/>

### Validate: Verify systematically (/stepwise-dev:validate_plan)

```bash
/stepwise-dev:validate_plan @thoughts/shared/plans/2025-11-15-oauth.md
/clear
```

Claude verifies everything is implemented: all phases completed, tests passing, code matches plan, no undocumented deviations.

## Want to try it?

[Install `stepwise-dev`](https://github.com/nikeyes/stepwise-dev?tab=readme-ov-file#-installation) and use it in your next work session.

```bash
# In Claude Code
/plugin marketplace add nikeyes/stepwise-dev
/plugin install stepwise-dev@stepwise-dev

# Restart Claude Code
```

## What really changes with Stepwise-dev

I used Claude Code for months before creating [`stepwise-dev`](https://github.com/nikeyes/stepwise-dev).
The problem wasn't knowing how to write maintainable code with Claude Code. The problem was managing context well.

**The fundamental difference is the [thoughts/ directory](https://github.com/nikeyes/stepwise-dev?tab=readme-ov-file#-directory-structure):**

The `/thoughts` folder is an external brain for Claude Code. Each phase produces reusable knowledge for Claude Code, its agents, other sessions, or humans.

With `stepwise-dev`:
- **Research** -> Saved in `thoughts/shared/research/` -> `/clear` without fear
- **Plans** -> Saved in `thoughts/shared/plans/` -> Iterative design without filling context
- **Implement** -> Reference the plan -> Context always < 60%
- **Validate** -> Compare against plan -> Systematic verification

**What it solves:**
  1. **"Where did I save that info?"** -> Everything in `thoughts/shared/`, always accessible
  2. **"Why did we decide this?"** -> Each decision has its associated research or plan
  3. **"New to the team"** -> Read `shared/` and understand the project
  4. **"Research again"** -> If it's in `thoughts/`, no need to re-research

But above all, now Claude Code follows your `CLAUDE.md` consistently because the context never fills up.

You won't go faster, but now you have **automatic context control in your workflow.**

---

## References

### About Context Engineering
- [Advanced Context Engineering for Coding Agents - Dex Horthy](https://hlyr.dev/ace)
- [Frequent Intentional Compaction - HumanLayer](https://github.com/humanlayer/humanlayer/blob/main/.claude/README.md)
- [I Mastered the Claude Code Workflow - Ashley Ha](https://medium.com/@ashleyha/i-mastered-the-claude-code-workflow-145d25e502cf)
- [Context Engineering SF: Advanced Context Engineering for Agents](https://www.youtube.com/watch?v=VvkhYWFWaKI)
- [Avoiding Skill Atrophy in the Age of AI](https://addyo.substack.com/p/avoiding-skill-atrophy-in-the-age)
- [Effective context engineering for AI agents - Anthropic](https://www.anthropic.com/research/context-engineering)
- [12-Factor Agents - Own your context window](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-03-own-your-context-window.md)

### Studies on attention windows
- [Lost in the Middle (Liu et al., 2024)](https://aclanthology.org/2024.tacl-1.9.pdf)
- [RULER Benchmark (Hsieh et al., 2024)](https://ar5iv.labs.arxiv.org/html/2404.06654)
- [Long Context RAG Performance - Databricks](https://www.databricks.com/blog/long-context-rag-performance-llms)
- [Effective Context Engineering - Anthropic](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
