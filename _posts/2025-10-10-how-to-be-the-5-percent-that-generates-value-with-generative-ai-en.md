---
layout: post
title: How to be the 5% that generates value with generative AI
categories:
  - GenAI
  - LLMs
  - AI-guided development
tags:
  - GenAI
  - LLMs
  - AI-guided development
lang: en
ref: how-to-be-the-5-percent-that-generates-value-with-generative-ai
published: true
---

> "Ideas are easy. Execution is everything." - John Doerr

A few days ago I explained that [95% of generative AI projects fail](https://nikeyes.github.io/only-5-percent-ai-projects-create-business-value-en/). I suppose you're also interested in knowing **how to be that 5% that succeeds**.

The answer lies in how we define, build, operate, and measure.

But first, the question almost nobody asks.

## Are you sure AI is the answer?

Many projects fail because they try to solve problems with AI that don't need it.

**Use AI when rules don't scale:**
Analysis of unstructured documents, personalized content, assistance where each case is different. When writing all the rules is impossible, AI makes sense.

**Use AI when the numbers add up:**
If automating costs more than what you save, there's no business case.
The cost of building, scaling, and maintaining the AI system must be lower than the human cost.

**Don't use AI if you can solve it classically:**
Calculations, validations, clear rules. An if/else is cheaper, faster, and more reliable than a model.

**Don't use AI if the risk is unacceptable:**
Critical decisions without human review, regulated sectors, failures with serious consequences. Ask yourself what happens if the system doesn't behave as expected: how serious is it?

## The 3 errors that guarantee failure

**POC after POC, never production:**
Measuring success by "wow" demos instead of ROI.
Three brilliant pilots, zero systems in production. If after 6 months there are no real users using the system, you don't have an AI project, you have an expensive hobby.

**"We'll optimize later":** $50K token bill the first month in production.
No estimates, no cache, no limits, no monitoring. You discover the problem when finance asks why the LLM provider bill exceeded the quarter's budget.

**Ignoring domain specialization:**
If you use an LLM as-is, you have no competitive advantage. Real differentiation is in how you specialize it with your data and your domain.

Now that you know what to avoid, let's see how to do it right.

## The 5 obstacles you need to overcome

### 1. Value first, technology second

**The problem:** We create impressive demos without business impact. Technical prototypes without users or metrics. Pilots that never scale.

**Key question:** Am I building this because it's cool, or because it solves a measurable problem for someone specific?

**What to do:**
- Define business metrics before writing code: time saved, errors prevented, revenue generated.
- Start with measurable MVPs. One flow, one process, one metric.
- If after N weeks there's no measurable impact, cancel or pivot.

**Real case: [Lumen](https://www.microsoft.com/en/customers/story/1771760434465986810-lumen-microsoft-copilot-telecommunications-en-united-states)**
- Problem: Client research consumed 4h per salesperson
- Solution: Microsoft Copilot for research and analysis
- Metrics:
  - From 4 hours to 15 minutes for client research (94% reduction)
  - $50M in revenue opportunity during 12 months from freed time
  - Clear metric from day 1: time saved per salesperson

### 2. Convert uncertainty into confidence

**The problem:** Responses can be incorrect, inaccurate, or invented. You discover problems late or your users discover them. There's no traceability or governance.

**What to do:**
- Make the model's reasoning visible. A "Why do you recommend this?" button is worth more than new AI features.
- Observability from day 1. Structured logs, real-time metrics, automatic alerts.
- Continuous quality testing. Are responses consistent? Do they remain correct after updating the prompt?
- Human-in-the-loop for critical decisions: define points where someone can intervene, correct, or override.
- Runbooks for incidents. When it fails (and it will fail), what do you do?

**Real case: [CirrusMD](https://writer.com/blog/roi-for-generative-ai/)**
- Problem: Clinical documentation consumes physician time
- Solution: Agentic AI for coverage navigation, benefits, and SOAP notes
- Metrics:
  - Complete automation of two critical flows
  - 13M+ members served
  - Highly regulated sector with constant supervision
  - Key: system generates notes but always requires medical review

### 3. Architecture: simple today, adaptable tomorrow

**The problem:** Premature abstractions that collapse when changing versions or providers. Using the latest libraries you saw on YouTube but that have breaking changes in every version.

**What to do:**
- Define clear contracts independent of the provider
- Maintain prompt templates per provider for critical cases
- Create automatic evaluations
- Implement output normalization to your standard internal format
- If a library changes its API every month, better create your own simple adapter

**Real case: [Team that abandoned their AI framework](https://mubashirullahd.medium.com/migrating-away-from-langchain-lessons-learned-from-upgrading-our-ai-codebase-2f8fe1cb14f3)**
- Problem: Application on LangChain. After 10 months, when updating models, they had serious problems due to dependency conflicts
- Solution: Abandoned the framework and migrated to custom code directly against APIs
- Result:
  - Significantly simpler and more maintainable code
  - Elimination of fragile dependencies
  - Centralized maintenance in utilities vs multilayer abstractions
  - Key questions: "How often are we going to change models? Was all this framework complexity worth it?"

### 4. Economic sustainability

**The problem:** Infinite retries, poorly managed context windows, exponentially growing bills. If there's no margin, there's no business.

**What to do:**
- Establish token budgets per use case. Don't leave consumption unlimited.
- Implement aggressive caching. The same question shouldn't reach the API twice.
- Monitor in real time. A cost spike is a symptom of something broken.
- If it's not profitable, you won't be able to scale.

**Real case: [Vodafone (TOBi)](https://www.nexgencloud.com/blog/case-studies/how-ai-and-rag-chatbots-cut-customer-service-costs-by-millions)**
- Problem: 600M+ subscribers with recurring queries
- Solution: AI chatbot with RAG over knowledge base
- Metrics:
  - 70% of queries resolved without human intervention
  - Key: monitor cost per operation vs value generated

### 5. Precision when it matters

**The problem:** In regulated or high-risk sectors, "almost correct" isn't enough. An error can have serious consequences. **And generic LLMs, by definition, are mediocre generalists in specific domains.**

**What to do:**
- Specialize models in your domain. Use Fine-tuning, RAG, or specific models.
- Validate continuously. Define minimum precision thresholds and monitor degradation.
- Implement escalated human review based on decision risk level.

**Real case: [LawGeex](https://www.virtasant.com/ai-today/ai-contract-mangement-legal)**
- Problem: Validate AI effectiveness vs human lawyers
- Solution: Test with 20 experienced lawyers vs AI on NDAs
- Metrics:
  - AI: 94% precision in 26 seconds
  - Lawyers: 85% precision in significantly more time
  - Success: AI specialized in specific domain with continuous validation

## This is what really matters

The difference isn't in the models you use.
It's in the questions you ask yourself before writing code. **Are you building the right thing?**

**Start small, but complete:** Don't make 10 demos. Make 1 end-to-end flow in production with telemetry and measurable impact.

**Specialize, don't generalize:** Your advantage is in your domain knowledge. LLMs work well for generic problems; you win in niche ones with Fine-tuning, RAG, or specific models.

**Keep architecture simple:** Don't add abstractions or frameworks "just in case". Ask yourself: do I really need now all these possibilities this new framework gives me?

**Integrate into existing flows:** If AI adds friction, nobody will use it. The best AI is invisible to the user.

**Iterate with real users:** Your team will say it works. Real users will teach you where it fails and if you're solving a real problem.

Remember that success isn't in how much code you generate, but in how much value you deliver.

---

**Other references:**
- [MIT Nanda - The GenAI Divide - State of AI in business 2025](https://mlq.ai/media/quarterly_decks/v0.1_State_of_AI_in_Business_2025_Report.pdf)
- [McKinsey - One year of agentic AI: Six lessons from the people doing the work](https://www.mckinsey.com/~/media/mckinsey/business%20functions/quantumblack/our%20insights/one%20year%20of%20agentic%20ai%20six%20lessons%20from%20the%20people%20doing%20the%20work/one-year-of-agentic-ai-six-lessons-from-the-people-doing-the-work_final.pdf)
- [MIT Says 95% of AI Pilots Fail. McKinsey Explains Why. Agentic Engineering Shows How to Fix It.](https://medium.com/generative-ai-revolution-ai-native-transformation/mit-says-95-of-ai-pilots-fail-mckinsey-explains-why-agentic-engineering-shows-how-to-fix-it-66a7bb2d8e0d)
