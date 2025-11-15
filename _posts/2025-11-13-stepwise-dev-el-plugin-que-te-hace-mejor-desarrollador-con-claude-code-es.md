---
layout: post
title: Stepwise-dev - El plugin de Claude Code que te hace mejor desarrollador
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
ref: stepwise-dev-plugin-claude-code
published: false
---

> "Context engineering over prompt engineering" - Andrej Karpathy

Ya has visto todos los tutoriales de Claude Code. Has creado tu flamante CLAUDE.md y tienes unas buenas reglas de arquitectura y diseño. ¡A desarrollar!

Pero cuando Claude Code lleva un rato haciendo cambios empieza a olvidar tus reglas y ya no desarrolla como te gustaría.

**El problema no son tus reglas. El problema es que no estas controlando el contexto.**

## Por qué tener un CLAUDE.md no es suficiente

Mi [CLAUDE.md](https://github.com/nikeyes/claude-code-config/blob/main/CLAUDE.md) define principios claros y sólidos. Pero hay un problema: Las mejores reglas del mundo no sirven si Claude Code tiene **demasiado contexto**.

## Lo importante no son las ventanas de contexto, son las ventanas de atención

Los fabricantes de LLMs anuncian ventanas de contexto enormes. Claude 3.5 Sonnet acepta 200k tokens. Gemini 1 millón. Suena impresionante.

Pero hay que diferenciar entre **cuánto contexto aceptan** (la ventana de contexto) y **cuánto contexto pueden procesar de forma eficaz** (la ventana de atención).

### La ventana de contexto vs la ventana de atención

Los fabricantes no publican información de sus ventanas de atención para no revelar detalles de implementación de sus arquitecturas.
Pero la comunidad ha intentado buscar el tamaño de la ventana de atención de forma empírica. Probando, probando y probando.
En todos estas pruebas se demuestra que la ventana de atención es menor que la ventana de contexto.

| Modelo       | Ventana de contexto | Ventana de atención        | Fuente                       |
|--------------|---------------------|----------------------------|------------------------------|
| GPT-4 Turbo  | 128k tokens         | ~64k tokens (50%)          | [RULER Benchmark](https://ar5iv.labs.arxiv.org/html/2404.06654)  |
| Claude 3/3.5 | 200k tokens         | Significativamente menor   | [Anthropic: "LLMs lose focus with long contexts"](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) |
| LLaMA 3.1    | 128k tokens         | ~32k tokens (25%)          | [Evaluaciones RAG Databricks](https://www.databricks.com/blog/long-context-rag-performance-llms)  |
| Mistral 7B   | 32k tokens          | ~16k efectivos (50%)       | [Benchmark RULER](https://ar5iv.labs.arxiv.org/html/2404.06654)              |

**Las pruebas demuestran que después del 50-60% de las ventana de contexto, la precisión cae entre 20-50% dependiendo del modelo.**

Después de varios meses trabajando con Claude Code y revisando el contexto de mis tareas, he creado el plugin stepwise-dev para que mantengas tu contexto por debajo del 60% mientras sigues un proceso riguroso que genera soluciones mantenibles.

## Stepwise-dev - Research → Plan → Implement → Validate

La solución no es escribir mejores prompts. Es estructurar tu flujo de trabajo para mantener el contexto controlado.


### Research: Investiga antes de escribir código

**Objetivo:** Entender qué existe sin cargar todo en memoria.

**Problema típico:** Pides a Claude "investiga cómo funciona X" y Claude carga 15 archivos, descarga información de la web, analiza, y cuando terminas tienes el 65% de contexto con información que ya no vas a necesitar.

**Solución con stepwise-dev:**
```bash
/stepwise-dev:research_codebase "How does authentication work in this project?"
```

Claude lanza hasta **5 agentes especializados en paralelo**:
- `codebase-locator`: Encuentra dónde vive el código
- `codebase-analyzer`: Entiende cómo funciona
- `codebase-pattern-finder`: Busca patrones similares
- `thoughts-locator`: Busca documentación previa
- `thoughts-analyzer`: Extrae insights de docs anteriores

**Resultado:** Un documento de research en `thoughts/shared/research/` con arquitectura, archivos clave, y patrones identificados. Ya puedes hacer `/clear`.

El conocimiento persiste pero el contexto se limpia.

### Plan: Itera el diseño antes de implementar

**Objetivo:** Crear un plan detallado que puedas revisar antes de escribir código.

Dex Horthy (HumanLayer) lo resume así:

> "A bad line of code is... a bad line of code. But a bad line of a plan could lead to hundreds of bad lines of code."

Revisar 200 líneas de plan es más fácil que revisar 2000 líneas de código.

**Solución con stepwise-dev:**
```bash
/stepwise-dev:create_plan @thoughts/shared/research/2025-11-15-auth.md
```

Claude crea un plan estructurado en fases. Tú iteras 3-5 veces con Claude hasta que el plan es sólido.

**Clave:** Corriges errores de diseño aquí, no después de implementar.

### Implement: Una fase a la vez

**Objetivo:** Implementar incrementalmente, verificando en cada paso.

**Solución con stepwise-dev:**
```bash
/stepwise-dev:implement_plan @thoughts/shared/plans/2025-11-15-oauth.md Phase 1 only
/clear
/stepwise-dev:implement_plan @thoughts/shared/plans/2025-11-15-oauth.md Phase 2 only
```

Cada fase:
1. Claude lee el plan completo
2. Implementa solo UNA fase
3. Ejecuta tests
4. Espera tu confirmación manual
5. `/clear` antes de la siguiente fase

**Resultado:** Contexto nunca supera 60%. Código coherente porque cada fase tiene contexto limpio.

### Validate: Verifica sistemáticamente

**Objetivo:** Confirmar que implementaste correctamente todo el plan.

**Solución con stepwise-dev:**
```bash
/stepwise-dev:validate_plan @thoughts/shared/plans/2025-11-15-oauth.md
```

Claude verifica:
- ✓ Todas las fases completadas
- ✓ Tests pasando
- ✓ Código coincide con plan
- ✓ No hay desviaciones sin documentar

## El sistema de memoria: thoughts/

Aquí está la diferencia fundamental con solo usar prompts:

**Sin stepwise-dev:**
- Investigas → `/clear` → Se pierde todo
- Dos semanas después: vuelves a investigar lo mismo

**Con stepwise-dev:**
- Investigas → Se guarda en `thoughts/shared/research/`
- Planificas → Se guarda en `thoughts/shared/plans/`
- Implementas → Referencias el plan
- Validas → Comparas con el plan

**Ventajas:**
1. **Conocimiento persistente**: El research de hace 3 semanas sigue disponible
2. **Decisiones documentadas**: "¿Por qué usamos esta librería?" → Está en el research doc
3. **Equipo alineado**: Todos leen `shared/`, no solo tú
4. **Zero retrabajo**: No repites investigaciones

## ¿Quieres probarlo?

[Instala stepwise-dev](https://github.com/nikeyes/stepwise-dev?tab=readme-ov-file#-installation)

```bash
# En Claude Code
/plugin marketplace add nikeyes/stepwise-dev
/plugin install stepwise-dev@stepwise-dev

# Reinicia Claude Code
```

## Tu primer workflow

**1. Research:**
```bash
/stepwise-dev:research_codebase "How does user authentication work?"
```
Claude inicializa `thoughts/` automáticamente y genera research con 5 agentes paralelos.

**2. Plan:**
```bash
/stepwise-dev:create_plan @thoughts/shared/research/2025-11-15-auth.md
```
Itera 3-5 veces hasta que el plan es sólido.

**3. Implement Phase 1:**
```bash
/stepwise-dev:implement_plan @thoughts/shared/plans/2025-11-15-oauth.md Phase 1 only
```
Una fase. Tests. `/clear`.

**4. Implement Phase 2:**
```bash
/stepwise-dev:implement_plan @thoughts/shared/plans/2025-11-15-oauth.md Phase 2 only
```
Siguiente fase. Tests. `/clear`.

**5. Validate:**
```bash
/stepwise-dev:validate_plan @thoughts/shared/plans/2025-11-15-oauth.md
```
Verificación completa.

**Total:** El contexto nunca superó 60%, conocimiento documentado para siempre.

## Lo que realmente cambia

No es velocidad. Es sostenibilidad.

**Día 1:** Implementas una feature con stepwise-dev. Tardas lo mismo que sin él.

**Día 30:** Tu código es mantenible porque documentaste decisiones.

**Día 60:** Nuevos devs leen research/plans en lugar de 100 archivos.

**Día 90:** Tienes una biblioteca de research/plans reutilizables.

**Día 180:** No has reescrito el proyecto desde cero.

Stepwise-dev no es magia. Es un flujo de trabajo consistente para trabajar con LLMs.

- "Research": Investigación separada de implementación
- "Plans": Planes de implementación iterados hasta que son sólidos
- "Implement": Implementación por fases, nunca todo de golpe
- "Validate": Validación sistemática al final
- Documentación automática y resumida que sirve de contexto para el futuro.

Y todo sin superar el 60% de contexto. Nunca.

---

## Referencias

### Context Engineering
- [Advanced Context Engineering for Coding Agents - Dex Horthy](https://hlyr.dev/ace)
- [Frequent Intentional Compaction - HumanLayer](https://github.com/humanlayer/humanlayer/blob/main/.claude/README.md)
- [I Mastered the Claude Code Workflow - Ashley Ha](https://medium.com/@ashleyha/i-mastered-the-claude-code-workflow-145d25e502cf)

### Estudios sobre ventanas de atención
- [Lost in the Middle (Liu et al., 2024)](https://aclanthology.org/2024.tacl-1.9.pdf)
- [RULER Benchmark (Hsieh et al., 2024)](https://ar5iv.labs.arxiv.org/html/2404.06654)
- [Long Context RAG Performance - Databricks](https://www.databricks.com/blog/long-context-rag-performance-llms)
- [Effective Context Engineering - Anthropic](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents)
