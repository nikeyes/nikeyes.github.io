---
layout: post
title: If AI Writes the Code, What Does the Developer Do?
categories:
  - GenAI
  - LLMs
  - AI-Driven Development
tags:
  - GenAI
  - LLMs
  - AI-Driven Development
  - Future of the Developer
  - Service as Software
  - AI Agents
lang: en
ref: el-desarrollador-ya-no-escribe-codigo-disena-la-fabrica-que-lo-construye
published: true
---

> "When anyone can build anything, knowing what's worth building becomes the skill." - Kent Beck



I've been writing much less code than before for months. Not zero, but enough to notice something uncomfortable: it matters less and less. And I'm not alone,  [84% of developers already use AI at work or plan to soon](https://survey.stackoverflow.co/2025/ai).

If generating code is no longer the problem, **what should a developer focus on?**

## Your value is no longer in writing code

Something interesting is happening in teams that adopt AI: they produce more, but not necessarily better.
More PRs, more speed… but also more review, more friction, and sometimes more bugs.
Data from [Faros AI](https://www.faros.ai/blog/ai-software-engineering) (10,000+ developers): 98% more PRs, but review time goes up 91% and bugs per developer grow 9%.
Not because AI is bad, but because **it accelerates exactly the part that wasn't the problem**.
The problem was never writing code. It's deciding what to build, how to validate it, and how to keep it under control.

AI doesn't work alone. The [METR study](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/) from early 2025 found that experienced developers took 19% longer with AI. But they used Cursor Pro directly, without preparing repos, without context, without rules, without hooks. Any tool performs badly that way.
You have to configure your environment so AI works well.

Writing code is trivial in many cases now. Making that code correct and maintainable requires investing time and effort in configuring the system.

## Three things to focus on as a developer

### 1. Guardrail Architect: design the system that verifies, don't verify yourself

[Martin Fowler](https://martinfowler.com/articles/exploring-gen-ai/humans-and-agents.html) distinguishes between being **in** the loop (you review every line, which is completely unsustainable) and being **above** the loop (you design the system that reviews for you). He calls it Harness Engineering.

In practice this means: automatic linting, tests that the agent itself runs in its loop, mutation testing as a real safety net, and LLM-as-judge, one AI evaluating the output of another.
[Addy Osmani](https://addyosmani.com/blog/factory-model/) sums it up well: your job is no longer to write code, it's to build the factory that builds it.

Your responsibility shifts from reviewing PRs to **designing the controls that make review unnecessary**.

### 2. Specification Engineer: define the what, leave the how to the agent

Increasingly, the real work of the developer is writing good specifications: what this needs to do, what constraints it has, how to know it's done right. The agent handles the how. Review stops being about code and becomes about specifications.

Kent Beck talks about [programming deflation](https://tidyfirst.substack.com/p/programming-deflation) and explains it clearly: programming is getting cheaper, like when a product drops in price. What doesn't get cheaper is everything else. Understanding the problem, knowing how to break it down, having the judgment to decide what to build and what not to.
Those skills are now worth more than ever, precisely because code is **no longer** what's scarce.

### 3. Platform Enabler: make sure others don't need you

This is the most radical change. Your job is no longer to write the product code. It's to make sure others don't need you to write it. You create the tools, automations, and guardrails so that POs, PMs, designers, and other business roles can build directly. But be careful: this only works if point 1 is solved. Without guardrails, letting those roles deploy code to production is a recipe for disaster.

Andrew Ng is already living this: [the ratio of 4 engineers per PM is reversing in some of his teams](https://x.com/lennysan/status/1943773031459172360). The bottleneck has moved from implementing to defining. We're no longer talking about **developer experience** for devs, we're talking about **developer experience** for every role.

## The business model changes too, and so do you

There's not just a role change, there are business model changes that force us to adapt.
Traditional SaaS gives you tools so humans can do their work. The new model, [Service as Software](https://foundationcapital.com/ai-service-as-software/), offers agents that **do the work directly**.
Until now you paid for customer support software (Zendesk, Intercom) and put people to use it. The new model is an agent that directly resolves customer queries. You don't pay for the tool, you pay per resolved query. [Salesforce already charges this way with Agentforce](https://www.salesforce.com/agentforce/pricing/).

This is where it gets complex. Every time the agent runs you're paying. Sometimes it gets it right, sometimes not. And when it doesn't, it's not a bug you log in Jira: it's an error that has already made decisions and may have pulled others errors along with it.

## The change is already here

The developer doesn't disappear, but the work changes:

- From **writing code** to **deciding what code is worth building**
- From **reviewing PRs** to **designing validation systems**
- From **implementing features** to **enabling others to build them**
- From **developer experience** for devs to **developer experience** for every role

Now that code is cheap, what's scarce is judgment.


This article wouldn't exist without [Gorka Moreno](https://www.linkedin.com/in/gorkma/) for sharing everything [they are learning](https://www.linkedin.com/posts/gorkma_hasta-ahora-ten%C3%ADa-claro-que-el-rol-del-desarrollador-activity-7437479812765728768-hw4h/) and [Emilio Carrión](https://www.linkedin.com/in/emcarrio/) for articles like [this one](https://www.emiliocarrion.com/en/blog/agente-ia-necesita-verificacion).
