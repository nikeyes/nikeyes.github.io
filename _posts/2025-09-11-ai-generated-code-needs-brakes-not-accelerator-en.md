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

We can generate 1000 lines in an hour, but validating whether they're useful takes weeks. The bottleneck remains the same: **knowing what the next increment is that brings us closer to our objectives**.

## The problem isn't new (but it has been amplified)

[Extreme Programming (XP)](https://www.geeksforgeeks.org/software-engineering/software-engineering-extreme-programming-xp/) was born in the 90s with a clear objective: prevent code from growing faster than our ability to validate it. That's why XP insists on short cycles, constant testing, and continuous feedback.

If we don't put brakes on AI, it becomes a waste-generating machine. It generates layers and layers of unvalidated logic in the market, adding assumptions and architectural complexity that grows exponentially. The result is fragile, tangled code that becomes increasingly expensive to modify.

According to [AI Copilot Code Quality, by GitClear (2025)](https://www.gitclear.com/ai_assistant_code_quality_2025_research), the frequency of code blocks with more than 5 duplicate lines multiplied by eight during 2024.

We're building houses of cards at the speed of light.

## What if we let AI fix everything?

Here comes the irony: AI tools work better on clean, well-documented, and well-structured code. This provides them with clear, high-quality context to understand the developer's intention and generate precise and coherent results.  
Furthermore, [the latest Sonar study](https://arxiv.org/abs/2508.14727) concludes that all evaluated AI models (including Claude Sonnet 4, GPT-4o, and Llama) always introduce bugs, security vulnerabilities, and maintainability issues or "code smells."

![distribution_of_issue_types_by_LLM.png]({{ site.baseurl }}/images/2025-09-11-el-codigo-generado-con-ia-necesita-frenos-no-acelerador/distribution_of_issue_types_by_LLM.png)

This confirms what many already intuited: **AI is fantastic at solving today's problem, but terrible at preparing code for tomorrow.**

If you use AI without discipline, you'll create a chaotic codebase. That same chaos makes AI increasingly less effective, until neither it nor humans understand what's happening.

You've invested in a Ferrari to drive it through a traffic jam that you're creating yourself.

## The solution isn't more speed, but better brakes

If creating code faster doesn't give us better software, the answer isn't to accelerate more, but to apply intelligent restrictions.

This is where XP principles become indispensable. 
XP never sought to maximize production. XP introduced deliberate friction to force learning and alignment.

XP is simple but powerful: go slower on the small things to be able to go faster on the big things.

## Where is the real value?

AI is brilliant at solving already-solved problems: authentication, CRUD, back offices, etc. But your product's value isn't in the boilerplate.

The value is in:
- The business rules specific to your domain
- The unique knowledge your team has about your users
- The inherent complexity of the problem you solve

These are exactly the elements that AI can't generate because they don't exist on Stack Overflow. They're unique to your context, and this is where your human experience is irreplaceable.

Invest time in practices that seem "slow" in the short term, like TDD, pair programming, constant refactoring, and small deliveries, to gain exponential speed in the medium/long term: fewer bugs in production, less technical debt, and practically zero rework.

It's important to remember that:
- **Pair programming** creates consensus, duplicates knowledge, and brings hidden assumptions to light. It's an investment in learning, not in mass production of code.  
- **Simplicity** is the art of maximizing work not done because every line of code has maintenance cost.
- **Continuous feedback** is the only way to know if we're going in the right direction. Speed is useless without feedback loops.
    
## Behind every successful product are conversations, not just code

Despite the rise of AI, the obstacles to delivering value remain the same:
- **Alignment**: keeping the team synchronized amid changing priorities.
- **Shared context**: ensuring everyone understands the problem and its evolution.
- **Clarity in objectives**: defining goals that can be adjusted based on learning.
- **User validation**: continuously iterating based on real feedback.
- **Constant adaptability**: modifying approaches and decisions when circumstances change.

Developing software is about people, not just code.  
We need frameworks that guide us to people-centered practices.  
XP gives us discipline and empathy: it puts the team at the center and elevates shared understanding above brute speed.


## The senior developer's role evolves

Now we're the ones who have to balance between AI speed and product quality.
And we're going to need new skills:
- **AI Whisperer**: Know how to communicate effectively with AI tools
- **AI Quality Gatekeeper:** Distinguish between code that works and maintainable code. AI can solve the immediate problem, but you decide if the solution will be maintainable in 6 months.
- **AI System Architect:** Design systems where humans and AI collaborate sustainably, creating architectures that empower the team while maintaining system simplicity and clarity in the long term.


## What really matters

With AI you can generate brilliant solutions in minutes, but also create big problems in seconds.

Human experience remains crucial.

We need discipline over speed, clarity over quantity, and above all, people over code.  

And remember that with or without AI, the most important question remains the same: **Are we building the right thing?**

These principles aren't new, but their relevance is greater than ever. Let's consider them a **manifesto for navigating the AI era**.

---

*"Okay, but how do I apply these brakes in my day-to-day?"*

If you're interested in the topic, I'll share practical tips on how to implement these brakes.

Because knowing you need brakes is one thing, and knowing how and when to step on them is quite another.

## This article is much better thanks to feedback from:
- [heedrox/itortv](https://bsky.app/profile/heedrox.bsky.social)
- [Edu Ferro](https://bsky.app/profile/eferro.net)

### *References:*
- [The Nature of Software Development](https://pragprog.com/titles/rjnsd/the-nature-of-software-development/)
- [El coste basal del software](https://www.eferro.net/2024/07/el-coste-basal-del-software.html)
- [Complejidad Accidental](https://medium.com/@pedromcarrion/complejidad-accidental-10f176632c10)
- [AI Copilot Code Quality, by GitClear (2025)](https://www.gitclear.com/ai_assistant_code_quality_2025_research)
- [Should we revisit Extreme Programming in the age of AI?](https://www.hyperact.co.uk/blog/should-we-revisit-xp-in-the-age-of-ai)
- [DORA - Impact of Gen AI in Software Development](https://dora.dev/research/ai/#impact-of-gen-ai-in-software-development)
- [Extreme Programming Explained: Embrace Change](https://www.amazon.com/Extreme-Programming-Explained-Embrace-Change/dp/0321278658)
- [What is Extreme Programming (XP)?](https://www.geeksforgeeks.org/software-engineering/software-engineering-extreme-programming-xp/)
- [Extreme Programming: A gentle introduction](http://www.extremeprogramming.org/)
- [Assessing the Quality and Security of AI-Generated Code: A Quantitative Analysis](https://arxiv.org/abs/2508.14727)

