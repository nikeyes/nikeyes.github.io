---
layout: post
title: A pairing guide for onboarding juniors
categories:
  - learning
  - good practices
  - AI-Driven Development
tags:
  - Pair Programming
  - Extreme Programming
  - Mentoring
  - Claude Code
  - good practices
lang: en
ref: guia-de-pairing-para-la-era-de-la-ia
published: false
---

Everybody works with AI now, and almost always alone. You can ask the agent to push back, and it will, for a while. Insist, and it will come around to your position, contradicting what it told you two messages ago. It was trained to please you. Your pair was not.

So when you work with juniors, **how you teach them** still matters just as much, even with Claude Code or Codex in front of you. The tool changes; the knowledge transfer does not.

I am helping a junior get into backend development and we are pairing. But he did not know what pairing was, so I wrote him this guide with all my notes: a collection from many articles, books and conversations. Together with our sessions, it works as a *from 0 to hero* guide.

A large part of what follows is a copy, sometimes almost word for word, of the [*Pairing Guidelines* written by Rubén Antón](https://docs.google.com/document/d/1dGyhrW-2ivwi0iVdmwJoi0-mhRtKOMQp5eBSYkUR0Ek/edit), which I liked a lot years ago.

In case it is useful to you in these new times, here it is.

---

## Why

Pairing is for **creating options, reducing risk and reducing rework**. The discussion while you write the code is the important part: reaching consensus forces better decisions, more alignment and fewer errors.

It is one of the twelve Extreme Programming practices, and in [*software economics* by Luis Artola](https://leanpub.com/software-economics) terms it is one of the most powerful risk management tools we have: it creates options, reduces complexity and raises the bus factor.

What we take home, besides the code:

- **Shared knowledge**, both technical and about the business.
- **Shared practices and values**: design, testing, pragmatism, YAGNI, transparency. You transmit that by pairing, not in a document.
- **Shared ownership**: less dependency on senior people.
- **Immediate onboarding**: a new person sees code and contributes from day one.
- **No pressure on the other person**: nobody should leave a session more stressed than they arrived.

## The two roles

The names come from rally racing. The driver takes the next corner. The navigator (copilot) reads the road ahead and calls it out. Neither one wins the race alone.

- **Driver**: has the keyboard. Works on the step you are on right now. The syntax, the logic, making this test pass.
- **Navigator**: hands off the keyboard. Works one step ahead. Where this is going, what is going to hurt in ten minutes, what you agreed to do next.

You swap all the time. Four things that are easy to get wrong:

- **Neither role is the senior one.** They are two jobs, not two levels. Juniors navigate too.
- **The navigator is not proofreading.** Pairing *is* review, and that is what saves you the review afterwards: two people agreed on this code while it was being written, not two days later. But you review decisions, not keystrokes. A missing semicolon is for the compiler.
- **The driver is not a typist.** You are not taking dictation. If you do not understand what you are typing, stop and ask. You are the one who will have to explain this code tomorrow.
- **The navigator is not resting.** Not typing is not watching. If you go quiet for ten minutes, there is one person in the session, not two.

The navigator is free to think because he is free from typing, and that is the whole reason there are two of you. Both roles are tiring, in different ways. That is why you swap often.

## Before you start

- **Goal**: what does "done" mean?
- **Modality**: capacitive or productive? ([see below](#modalities))
- **Style**: strong-style, ping-pong or free ([see below](#styles)).
- **Swap cadence**: every green test, or every 25 minutes.
- **Calendars**: how much time are we really going to pair? On which machine?
- **Setup**: in the office we use two keyboards, two mice and one computer, so nobody has to move to take over. Remotely, any editor with live collaboration or a screen share with remote control: we use [VS Code Live Share](https://visualstudio.microsoft.com/services/live-share/).

## The pair should

Whatever role you are in:

- Brainstorm refinements to the system, clarify ideas.
- Take the initiative when the other is stuck.

## As a driver

- Keep the focus on the current step. The navigator takes care of the horizon.
- Think out loud: what you are going to do, what you are doing, what you just did.
- **The handover test:** at any moment you should be able to stop typing and your pair should be able to take over.
- Ask for the keyboard when you need it. Not asking is also an error, and an invisible one.
- Do not drive faster than your pair can follow. Say it when something is making you frustrated.

## As a navigator

The driver looks at the **how** and the **what**. You look at the **what** and the **why**. You only share the middle.

<img src="{{ site.baseurl }}/images/2026-08-21-a-pairing-guide-for-onboarding-juniors-en/driver-navigator-what-how-why.png" alt="Driver focused on how and what, navigator focused on what and why" style="max-height:400px; width:auto; height:auto;"/>

<small>Image by Jasmine Siessegger, from <a href="https://www.thoughtworks.com/insights/blog/effective-navigation-in-pair-programming">Effective Navigation in Pair Programming</a> (ThoughtWorks).</small>

- **Keep the goal stack**: the ordered list of steps until you are done. It is what sets the abstraction level you both work at.
- Do not go tactical. The details belong to the driver.
- **Write it down, do not drop it.** Note ideas and obstacles; bring them up when the current goal is closed. If the driver is typing, he cannot listen to you.
- **The 5 second rule:** before you point at an error, wait. He may have seen it already.
- **Intent -> Location -> Detail.** Stop as soon as he can continue alone: 
  - "let's extract the discount calculation"
  - "that block in `calculateTotal`"
  - "lines 20-26, Cmd+Alt+M". 
  - Going straight to the detail every time is micromanagement.
- Talk in "we", not in "I" and "you".
- Keep the course: baby steps, YAGNI, KISS. The TDD cycle is your responsibility: "let's start with a test".
- Many low level interruptions means it is time to swap roles. It is not something to manage.
- Get paper and a pencil. Pseudocode, boxes and arrows. When we pair remotely we use [Miro](https://miro.com/) or [Excalidraw](https://excalidraw.com/).

## Styles

- **Ping-pong**: A writes a failing test, B makes it pass, B writes the next one. The best default with TDD: the role swap is built in.
- **Strong-style**: "for an idea to go from your head to the computer it must go through someone else's hands". The person with the idea *navigates*; the novice drives. It needs a driver who is comfortable not understanding everything yet. The "why" is discussed afterwards. Very good for knowledge transfer, close to micromanagement, do not overuse it. Success is being able to stop using it.
- **Free**: the most comfortable one and the easiest one to do badly.

## Modalities

Say it out loud. Otherwise one of you is teaching while the other is trying to finish.

- **Capacitive**: we trade productivity for knowledge transmission. Driver = the person receiving the knowledge.
- **Productive**: we trade knowledge transmission for productivity. Driver = the person with the most practice.

## Split time (not pairing)

- Trivial or mechanical task, either of you could do it alone, and there is nothing to learn. Careful: repetitive work can be a symptom of bad design.
- Too many unknowns for both of you: spike separately, agree on the questions first, and share the findings.
- Somebody needs time alone. You have to make room for that.
- **Keep pairing** on hard problems (you get a solution out of it) and on easy but important ones (that is where innovation comes from).
- Keep syncing up when you split. You still work on that story together.

## Time

- Pomodoro 25/5, **swap roles during the break**. Long break every four.
- **6 hours of pairing per day maximum.** Eight is not sustainable. Remotely it is even less: sharing a screen and a call all day is more tiring than sitting next to someone, so plan for 2-4.
- Rotate pairs to spread knowledge, but not just for the sake of it. Every rotation costs context, and lost context becomes rework. So rotate one person at a time: the one who stays passes on what is not written down anywhere.
- At the end of the day, a two minute mini retro. Did we swap roles enough? What would we change tomorrow? Make it a routine before something goes wrong.

## Common errors

- Starting without a clear goal.
- Monopolizing the keyboard, or never asking for it.
- Not letting your pair finish the sentence.
- Being comfortable only writing, or only reading.
- Never swapping, never resting.
- Changing modality without saying it.
- A navigator who goes quiet: usually communication broke, not interest. Try strong-style.
- Answer or check Slack in the middle of the session
- Pairing for eight hours because it was going well. Focusing with another person is exhausting even when it is fun. You can handle it for a day, but as a routine it is impossible.

## Conclusions

The challenge lies in getting to know your pair enough to notice when you are pairing badly. There is no single right way. The only test is whether you are getting the benefits. If you are not, change something.

---

## Appendix: what the evidence says

For when somebody asks whether this pays off. It is worth using it honestly, because the evidence is weaker than people usually claim.

**The central number** (Cockburn & Williams, XP2000, University of Utah experiment): pairing costs **~15% more time**, not double as intuition would say, and produces **~15% fewer defects**.

**Why that 15% pays for itself**, with the example from the paper itself: 50,000 lines at 50 LOC/hour is 1,000 hours alone and 1,150 hours in a pair, so 150 hours of cost. If testing finds those 225 extra defects, at 10 h/defect that is 2,250 hours: **15× the cost of pairing**. If they reach production, at 40 h/defect that is 9,000 hours: **60×**. That arithmetic is the authors' illustration, not a measurement. It is the shape of the argument, not a number about your team.

**Warnings, if we are going to quote this:**

- The studies do not agree. There are results of −29%, −52% of time, no difference at all, and a meta-analysis of 15 studies that finds no significant difference in duration. The 40-50% number people repeat comes from an experiment with 41 students and four short exercises.
- The "NASA study" (Wood & Kleb, *Exploring XP for scientific research*) does not measure pairing productivity: it is an XP pilot in a research context, and pairing was precisely the practice they could not apply. Let's not use it.
- Any experiment about productivity in software development is easy to argue against: there is too much uncertainty and too much that cannot be measured. **What convinces people is showing that it works here.** Let's measure our own rework.

---

## Links

- [Software economics](https://leanpub.com/software-economics) (Luis Artola. The cost/value/risk/debt framework, in Spanish)
- [The Costs and Benefits of Pair Programming](https://www.cs.utexas.edu/~ans/classes/cs439/projects/XPSardinia.PDF) (Cockburn & Williams. The 15% study)
- [Pair Programming vs. Solo Programming: What Do We Know After 15 Years of Research?](https://ieeexplore.ieee.org/document/7427855/) (meta-analysis)
- [On Pair Programming](https://martinfowler.com/articles/on-pair-programming.html) (Böckeler and Siessegger. The most complete treatment)
- [Effective Navigation in Pair Programming](https://www.thoughtworks.com/insights/blog/effective-navigation-in-pair-programming) (ThoughtWorks. Goal stack, communicating the intent)
- [Strong-Style Pairing](http://llewellynfalco.blogspot.com/2014/06/llewellyns-strong-style-pairing.html) (Falco)
- [Rotate pairs experiment](https://martinfowler.com/articles/rotate-pairs-experiment.html)
- Kent Beck, *XP Explained*
- [Pair Programming: mi guía práctica](http://juandavidvega.es/2015/11/08/pair-programming-mi-guia-practica/) (Juan David Vega, in Spanish)
- [Productive pair programming](http://www.carlosble.com/2015/07/productive-pair-programming/) (Carlos Blé)
- [Pairing Guidelines](https://docs.google.com/document/d/1dGyhrW-2ivwi0iVdmwJoi0-mhRtKOMQp5eBSYkUR0Ek/edit) (Rubén Antón. The base for most of this guide)

---

If you want to comment on something, you can write to me directly on [LinkedIn](https://www.linkedin.com/in/jorge-castro-nistal), [X](https://x.com/nikey_es), [Bluesky](https://bsky.app/profile/nikeyes.bsky.social) or [GitHub](https://github.com/nikeyes).
