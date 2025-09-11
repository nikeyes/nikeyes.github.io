---
layout: post
title: AI-Generated Code Needs Brakes, Not Accelerator
categories:
  - GenAI
  - LLMs
  - AI-Driven Development
tags:
  - GenAI
  - LLMs
  - AI-Driven Development
lang: en
ref: ai-code-brakes
published: true
---

> "There Is Surely Nothing Quite So Useless as Doing with Great Efficiency What Should Not Be Done At All." - Peter Drucker

AI has given us superhuman speed to create code, but we keep delivering mediocre projects. We've confused the **ability to generate code** with the **ability to deliver value**.

We can generate 1000 lines in an hour, but validating whether they serve any purpose takes weeks. The bottleneck remains the same: **knowing what to develop**.

## The problem isn't new (but it's amplified)

Extreme Programming (XP) was born in the 90s with a clear objective: prevent code from growing faster than our ability to validate it. That's why XP insists on short cycles, constant testing, and continuous feedback.

If we don't put brakes on AI, it becomes an entropy-generating machine. It generates layers upon layers of unvalidated market logic, adds assumptions and architectural complexity that grows exponentially. The result is fragile, tangled code that becomes increasingly expensive to modify.

According to [AI Copilot Code Quality, by GitClear (2025)](https://www.gitclear.com/ai_assistant_code_quality_2025_research), the frequency of code blocks with 5+ duplicated lines multiplied by eight during 2024.

We're building houses of cards at the speed of light.

## What if we let AI fix everything?

Here comes the irony: AI tools work better on clean, well-documented, and well-structured code.
If you use AI without discipline, you create a chaotic codebase. That same chaos makes AI increasingly less effective, until neither it nor humans understand what's happening.

You've invested in a Ferrari to drive it through an infinite traffic jam.

## The solution isn't more speed, but better brakes

If creating code faster doesn't give us better software, the answer isn't to accelerate more, but to apply intelligent constraints.

This is where XP principles become indispensable.
XP never intended to maximize production. XP introduced deliberate friction to force learning and alignment.

XP is simple but powerful: go slower on the small things to go faster on the big picture.
Invest time in practices that seem "slow" in the short term, like TDD, pair programming, constant refactoring, and small batches, to gain exponential speed in the medium/long term: fewer bugs in production, less technical debt, and practically zero rework.

It's important to remember that:
- **Pair programming** creates consensus, duplicates knowledge, and brings hidden assumptions to light. It's an investment in learning, not mass code production.
- **Simplicity** is the art of maximizing work not done because every line of code has maintenance costs.
- **Continuous feedback** is the only way to know if we're going in the right direction. Speed is useless without feedback loops.

## Behind every successful product are conversations, not just code

Despite the AI boom, the obstacles to delivering value remain the same:
- Alignment
- Shared context
- Clarity in objectives
- User validation

Developing software is about people, not just code. We need frameworks that anchor us to people-centered practices. XP gives us discipline and empathy: it puts the team at the center and elevates shared understanding above raw speed.

## Technical debt = AI blocker

Legacy code isn't just "hard to maintain," it's incompatible with AI. A clean, well-structured, and modular codebase is the prerequisite for effective integration of AI tools. Refactoring is no longer optional.

## The senior developer role evolves

Now we are the ones who have to balance the speed of AI with product quality.
And we are going to need new skills:
- **AI Whisperer**: Know how to communicate effectively with AI tools
- **AI Quality Gatekeeper:** Distinguish between code that works and maintainable code. AI can solve the immediate problem, but you decide if the solution will be maintainable in 6 months.
- **AI System Designer:** Design so humans and AI can collaborate and create structures where AI empowers the team without creating dependencies impossible for humans to maintain.

## What really matters

With AI you can generate brilliant solutions in minutes, but also create unsolvable problems in seconds.

Human experience remains crucial.

We need discipline over speed, clarity over quantity, and above all, people over code.
And remember that with or without AI, the most important question remains the same: **Are we building the right thing?**

These principles aren't new, but their relevance is greater than ever. Let's consider them a **manifesto for navigating the AI era**.

*References:*
- [The Nature of Software Development](https://pragprog.com/titles/rjnsd/the-nature-of-software-development/)
- [El coste basal del software](https://www.eferro.net/2024/07/el-coste-basal-del-software.html)
- [Complejidad Accidental](https://medium.com/@pedromcarrion/complejidad-accidental-10f176632c10)
- [AI Copilot Code Quality, by GitClear (2025)](https://www.gitclear.com/ai_assistant_code_quality_2025_research)
- [Should we revisit Extreme Programming in the age of AI?](https://www.hyperact.co.uk/blog/should-we-revisit-xp-in-the-age-of-ai)
- [DORA - Impact of Gen AI in Software Development](https://dora.dev/research/ai/#impact-of-gen-ai-in-software-development)
- [Extreme Programming Explained: Embrace Change](https://www.amazon.com/Extreme-Programming-Explained-Embrace-Change/dp/0321278658)

