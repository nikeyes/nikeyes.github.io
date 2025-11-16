---
layout: post
title: Tu CLAUDE.md no funciona (sin Context Engineering)
categories:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
tags:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
  - Claude Code
  - Context Engineering
lang: es
ref: tu-claude-md-no-funciona-sin-context-engineering
published: false
---

> "Context engineering over prompt engineering" - Andrej Karpathy

Ya has visto todos los tutoriales de Claude Code. 
Has creado tu flamante `CLAUDE.md` y tienes unas buenas reglas de arquitectura y diseño. ¡A desarrollar!

Pero cuando Claude Code lleva un rato haciendo cambios empieza a olvidar tus reglas y ya no desarrolla como necesitas.

**El problema no son tus reglas. El problema es que no estás controlando el contexto.**

## ¿Por qué tener un CLAUDE.md no es suficiente?

Mi [CLAUDE.md](https://github.com/nikeyes/claude-code-config/blob/main/CLAUDE.md) define principios claros y sólidos. Pero hay un problema: Las mejores reglas del mundo no sirven si Claude Code tiene **demasiado contexto**.

## Lo importante no son las ventanas de contexto, son las ventanas de atención

Los fabricantes de LLMs anuncian ventanas de contexto enormes. Claude 3.5 Sonnet acepta 200k tokens. Gemini 1 millón. Suena impresionante.

Pero hay que diferenciar entre **cuánto contexto aceptan** (la ventana de contexto) y **cuánto contexto pueden procesar de forma eficaz** (la ventana de atención).

### La ventana de contexto vs la ventana de atención

Los fabricantes no publican información de sus ventanas de atención para no revelar detalles de implementación de sus arquitecturas.
Pero la comunidad ha intentado buscar el tamaño de la ventana de atención de forma empírica. Probando, probando y probando.
En todas estas pruebas se demuestra que la ventana de atención es menor que la ventana de contexto.

| Modelo       | Ventana de contexto | Ventana de atención        | Fuente                       |
|--------------|---------------------|----------------------------|------------------------------|
| GPT-4 Turbo  | 128k tokens         | ~64k tokens (50%)          | [RULER Benchmark](https://ar5iv.labs.arxiv.org/html/2404.06654)  |
| Claude 3/3.5 | 200k tokens         | No he encontrado datos     | [Anthropic: "LLMs lose focus with long contexts"](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) |
| LLaMA 3.1    | 128k tokens         | ~32k tokens (25%)          | [Evaluaciones RAG Databricks](https://www.databricks.com/blog/long-context-rag-performance-llms)  |
| Mistral 7B   | 32k tokens          | ~16k efectivos (50%)       | [Benchmark RULER](https://ar5iv.labs.arxiv.org/html/2404.06654)              |

**Las pruebas demuestran que después del 50-60% de la ventana de contexto, la precisión cae entre 20-50% dependiendo del modelo.**

Después de varios meses trabajando con Claude Code, mi flujo de trabajo típico era:
- **Media hora** de productividad espectacular, Claude trabaja de forma impecable siguiendo mi `CLAUDE.md`
- **45 minutos después**: Claude, así no, recuerda tu `CLAUDE.md`. Pero empieza a ignorar mis reglas de diseño y el contexto del proyecto: ¿Por qué crea un nuevo servicio si le pedí usar el existente? ¿Por qué no ha implementado tests?
- **1 hora después**: Claude Code me va a compactar el contexto automáticamente. ¿Seguiré por encima del 60%? ¿Hago `/clear` y le explico todo otra vez? ¿Sigo así y me arriesgo a que siga ignorando mis reglas?
- **2 semanas después**: "¿Dónde guardé esa investigación de autenticación de la semana pasada?" -> Se la tengo que pedir de nuevo desde cero.

Este es mi contexto en una sesión nueva y limpia. De inicio ya está al 32% 😱: 

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/01_free_context.png" alt="" style="height:400px;"/>

Entonces encontré el marco "Frequent Intentional Compaction" (FIC) desarrollado por [Dex Horthy](https://x.com/dexhorthy/) y [HumanLayer](https://github.com/humanlayer/humanlayer). Este marco propone un flujo de trabajo estructurado en fases (Research -> Plan -> Implement -> Validate) para mantener el contexto controlado.  
He creado el plugin [stepwise-dev](https://github.com/nikeyes/stepwise-dev) para automatizar e implementar este flujo de trabajo FIC en Claude Code, manteniendo el contexto por debajo del 60% de forma sistemática.

## El marco FIC (Frequent Intentional Compaction)

Como explica [Dex Horthy en su charla sobre Context Engineering](https://www.youtube.com/watch?v=VvkhYWFWaKI), el problema de contexto se resuelve con un flujo de trabajo estructurado:

> "The key is to separate research, planning, and implementation into distinct phases with frequent intentional compaction."

El marco FIC propone 4 fases independientes:
- **Research**: Investigación sin implementación
- **Plan**: Diseño iterativo antes de código
- **Implement**: Ejecución por fases
- **Validate**: Verificación sistemática

Entre cada fase, se hace limpieza intencional del contexto (`/clear`), pero el conocimiento persiste en archivos estructurados.

**Stepwise-dev automatiza este flujo de trabajo FIC**, proporcionando comandos específicos para cada fase y gestionando automáticamente la persistencia del conocimiento en el directorio `thoughts/`.

## ¿Cómo implementa el marco FIC stepwise-dev?

La solución no es escribir mejores prompts. Es estructurar tu flujo de trabajo para mantener el contexto controlado.

Stepwise-dev implementa las 4 fases del marco FIC mediante comandos específicos. Cada fase empieza con contexto limpio.

### Research: Investiga sin implementar

El problema típico: pides a Claude "investiga cómo funciona X". Claude carga 15 archivos, analiza todo, y terminas con 65% de contexto lleno de información que ya no necesitas.

```bash
/stepwise-dev:research_codebase "How does authentication work in this project?"
/clear
```

Claude lanza hasta **5 agentes especializados en paralelo** (codebase-locator, codebase-analyzer, pattern-finder...), genera un documento en `thoughts/shared/research/`, y listo.

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/02_research_agents.png" alt="" style="height:400px;"/>

Cuando termina te guía en los siguientes pasos

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/03_research_output.png" alt="" style="height:400px;"/>


Y este es mi contexto después del research en una carpeta con 7 proyectos que interactúan entre ellos pero están implementados con diferentes tecnologías  (Astro, Java, Python)

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/04_research_context_after.png" alt="" style="height:400px;"/>

Después del `/clear`, conocimiento persistente. Contexto limpio.

### Plan: Diseña antes de implementar

Como dice [Dex Horthy](https://x.com/dexhorthy/) en [Context Engineering SF: Advanced Context Engineering for Agents](https://www.youtube.com/watch?v=VvkhYWFWaKI)

> "A bad line of code is... a bad line of code. But a bad line of a plan could lead to hundreds of bad lines of code."

Revisar 200 líneas de plan es más fácil que revisar 2000 líneas de código.

```bash
/stepwise-dev:create_plan is running… @thoughts/shared/research/2025-11-15-auth.md add token refreshes 
/clear

# Opcional: iterar el plan
/stepwise-dev:iterate_plan @thoughts/shared/plans/2025-11-15-auth.md "Añadir soporte para refresh tokens y manejo de expiración"
/clear
```
Claude crea un plan estructurado en fases. Tú iteras las veces que quieras hasta que el plan es sólido.

Recuerda que he lanzado `/create_plan` en una carpeta con 7 proyectos que interactúan entre ellos pero están implementados con diferentes tecnologías  (Astro, Java, Python)

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/05_plan_context_after.png" alt="" style="height:400px;"/>


**Clave:** Corriges errores en fase de diseño, no después de implementarlo.

### Implement: Implementa una fase cada vez

`Stepwise-dev` te permite implementar el plan completo. El problema es que seguramente hagas crecer el contexto más allá del 60%

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/07_plan_context_implement_all_fases.png" alt="" style="height:400px;"/>

Por eso es importante ejecutarlo por fases

```bash
/stepwise-dev:implement_plan @thoughts/shared/plans/2025-11-15-oauth.md Phase 1 only
/clear
```

Claude lee el plan completo, implementa **solo UNA fase**, ejecuta tests, y espera tu confirmación.

```bash
/stepwise-dev:implement_plan @thoughts/shared/plans/2025-11-15-oauth.md Phase 2 only
/clear
```

**Resultado:** El contexto nunca supera 60% en proyectos pequeños/medianos y se queda muy cerca del 60% en proyectos grandes. El código es coherente porque cada fase tiene el contexto limpio.

<img src="{{ site.baseurl }}/images/2025-11-13-tu-claude-md-no-funciona-sin-context-engineering-es/06_Plan_context_implement_fase_1.png" alt="" style="height:400px;"/>

### Validate: Verifica sistemáticamente

```bash
/stepwise-dev:validate_plan @thoughts/shared/plans/2025-11-15-oauth.md
/clear
```

Claude verifica que todo está implementado: todas las fases completadas, tests pasando, código coincide con el plan, sin desviaciones no documentadas.

## ¿Quieres probarlo?

[Instala stepwise-dev](https://github.com/nikeyes/stepwise-dev?tab=readme-ov-file#-installation) y úsalo en tu siguiente sesión de trabajo.

```bash
# En Claude Code
/plugin marketplace add nikeyes/stepwise-dev
/plugin install stepwise-dev@stepwise-dev

# Reinicia Claude Code
```

## Lo que realmente cambia con Stepwise-dev

He usado Claude Code durante meses antes de crear [stepwise-dev](https://github.com/nikeyes/stepwise-dev).  
El problema no era saber escribir código mantenible con Claude Code. El problema era gestionar bien el contexto:

**El ciclo sin fin:**
- Claude investiga -> Contexto al 70% -> ¿Hago `/clear` y pierdo info?
- Contexto crece -> Claude ignora mi `CLAUDE.md` -> Código inconsistente
- Busco "esa investigación de hace 2 semanas" -> Se perdió en un `/clear`

**La diferencia fundamental es el [directorio thoughts/](https://github.com/nikeyes/stepwise-dev?tab=readme-ov-file#-directory-structure):**

Con stepwise-dev:
- **Research** -> Se guarda en `thoughts/shared/research/` -> `/clear` sin miedo
- **Plans** -> Se guarda en `thoughts/shared/plans/` -> Diseño iterativo sin llenar contexto
- **Implement** -> Referencias el plan -> Contexto siempre < 60%
- **Validate** -> Comparas contra el plan -> Verificación sistemática

 **Qué soluciona:**
  1. **"¿Dónde guardé esa info?"** -> Todo en `thoughts/shared/`, siempre accesible
  2. **"¿Por qué decidimos esto?"** -> Cada decisión tiene su research o plan asociado
  3. **"Nuevo en el equipo"** -> Lee `shared/` y entiendes el proyecto
  4. **"Investigar de nuevo"** -> Si está en `thoughts/`, no se reinvestiga

Pero sobre todo, ahora Claude Code sigue tu `CLAUDE.md` de forma consistente porque el contexto nunca se llena.

No vas a ir más rápido, pero ahora tienes el **control del contexto sin pensar en ello.**

---

## Referencias

### Context Engineering
- [Advanced Context Engineering for Coding Agents - Dex Horthy](https://hlyr.dev/ace)
- [Frequent Intentional Compaction - HumanLayer](https://github.com/humanlayer/humanlayer/blob/main/.claude/README.md)
- [I Mastered the Claude Code Workflow - Ashley Ha](https://medium.com/@ashleyha/i-mastered-the-claude-code-workflow-145d25e502cf)
- [Context Engineering SF: Advanced Context Engineering for Agents](https://www.youtube.com/watch?v=VvkhYWFWaKI)
- [Avoiding Skill Atrophy in the Age of AI](https://addyo.substack.com/p/avoiding-skill-atrophy-in-the-age)
- [Effective context engineering for AI agents - Anthropic](https://www.anthropic.com/research/context-engineering)
- [12-Factor Agents - Own your context window](https://github.com/humanlayer/12-factor-agents/blob/main/content/factor-03-own-your-context-window.md)

### Estudios sobre ventanas de atención
- [Lost in the Middle (Liu et al., 2024)](https://aclanthology.org/2024.tacl-1.9.pdf)
- [RULER Benchmark (Hsieh et al., 2024)](https://ar5iv.labs.arxiv.org/html/2404.06654)
- [Long Context RAG Performance - Databricks](https://www.databricks.com/blog/long-context-rag-performance-llms)
- [Effective Context Engineering - Anthropic](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
