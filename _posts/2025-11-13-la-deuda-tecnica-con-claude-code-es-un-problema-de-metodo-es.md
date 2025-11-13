---
layout: post
title: La deuda técnica con Claude Code no es un fallo de la herramienta, es un problema de método
categories:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
tags:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
  - Claude Code
lang: es
ref: claude-code-tech-debt-method-problem
published: false
---

> "having tech debt w claude code is a skill issue" - Tweet viral en la comunidad de Claude Code

Vi ese tweet y me hizo reflexionar. Tenía razón, pero no de la forma que muchos pensaban.

El problema no es que Claude Code genere código malo. El problema es que **no sabemos trabajar con ventanas de contexto limitadas**.

Llevamos meses generando miles de líneas de código con IA, pero seguimos creando proyectos imposibles de mantener. Conversaciones que terminan con el contexto al 95%, archivos cargados sin criterio, y código que ni nosotros ni la IA pueden entender después de una hora de sesión.

**Hemos confundido velocidad de generación con capacidad de construir software mantenible.**

## El problema: context overflow silencioso

Trabajar con Claude Code sin método es como conducir mirando solo el velocímetro.

Vas rápido, te sientes productivo. Pero no ves que te estás desviando de la carretera hasta que es demasiado tarde.

Así es una sesión típica sin disciplina:

1. Abres Claude Code con una idea: "Voy a implementar autenticación con OAuth"
2. Cargas 5-6 archivos que crees relevantes
3. Pides a Claude que investigue cómo está implementado ahora
4. Claude lee 3 archivos más, te explica, propone cambios
5. "Vale, implementa eso"
6. Claude escribe código, falla un test, lee el test, lee 2 archivos más
7. "Ahora necesito añadir refresh tokens"
8. Claude lee documentación, añade más código
9. Compruebas el contexto: **89%**
10. Ya no sabes qué archivos tiene Claude cargados, qué decisiones tomó en el minuto 15, ni por qué eligió esa arquitectura

El resultado: código que funciona hoy pero que nadie entiende mañana. Ni tú, ni Claude.

## Los síntomas de trabajar sin método

**Conversaciones que nunca terminan:**
Empiezas implementando una cosa, acabas refactorizando tres cosas más sin saber por qué. La sesión se extiende 2 horas. Al final tienes 47 archivos modificados y has olvidado qué problema inicial querías resolver.

**El contexto siempre al límite:**
No miras el `/context` hasta que Claude empieza a olvidar cosas o a dar respuestas genéricas. Para entonces ya llevas 15 minutos escribiendo código basado en un contexto degradado.

**Implementaciones Frankenstein:**
Claude mezcla patrones de diferentes partes del código porque tiene todo cargado en memoria. El resultado es inconsistente: aquí usa un patrón, allí otro. Tu codebase pierde coherencia.

**Zero documentación de decisiones:**
¿Por qué elegiste esa librería? ¿Por qué descartaste el otro enfoque? ¿Qué casos edge investigaste? Nada está documentado. Todo quedó en el limbo de una conversación perdida.

**Retrabajo constante:**
Dos semanas después necesitas algo similar. Vuelves a investigar desde cero. Claude vuelve a leer los mismos archivos. Vuelves a tomar las mismas decisiones. Has perdido todo el conocimiento de la sesión anterior.

## De prompt engineering a context engineering

La comunidad ha pasado meses perfeccionando prompts: "Escribe código limpio", "Usa TypeScript strict", "Añade tests"...

Pero el problema no está en qué le pides a la IA. **El problema está en cuánto contexto le das y cuándo.**

**Andrej Karpathy (ex-Director de IA en Tesla y OpenAI) lo resumió perfectamente:**
*"Context engineering over prompt engineering"*

No necesitas mejores prompts. Necesitas mejor gestión del contexto.

Es como la diferencia entre gritar más fuerte y hablar más claro. El volumen no importa si el mensaje es confuso.

## La regla del 60%: tu nuevo límite de seguridad

En ingeniería de software tenemos límites por todas partes: no cargas toda la base de datos en memoria, no abres 1000 conexiones simultáneas, no haces deploy los viernes.

**Con Claude Code necesitas un límite más: nunca superes el 60% de contexto.**

¿Por qué 60% y no 80% o 90%?

Porque después del 60%, la calidad de las respuestas empieza a degradarse. Claude tiene que gestionar demasiada información irrelevante. Tarda más en responder. Las soluciones son menos precisas. Empieza a olvidar detalles clave de archivos que cargaste al principio.

Es como trabajar con 40 pestañas abiertas en el navegador. Técnicamente funciona, pero tu productividad cae en picado.

**¿Cómo mantienes el límite?**

Usa `/context` obsesivamente. Como un piloto revisando instrumentos.

- ¿Estás al 45%? Perfecto, sigue.
- ¿Llegaste al 60%? Para. Decide qué guardar, qué descartar, y qué documentar antes de continuar.
- ¿Superaste el 70%? Resetea YA. Haz `/clear` y carga solo lo esencial.

## El método: Research → Plan → Implement → Validate

Si el límite del 60% es tu instrumento de medida, necesitas un método que te mantenga por debajo.

La solución no es nueva. Es ingeniería básica: dividir para conquistar.

Pero adaptada a cómo funcionan las ventanas de contexto de los LLMs:

**Research (Investigar):**
- Contexto inicial: ~30%
- Objetivo: Entender qué existe y qué hay que cambiar
- Output: Documento de research en `thoughts/shared/research/`
- Comando: `/stepwise-dev:research_codebase`
- Al terminar: `/clear`

**Plan (Planificar):**
- Contexto inicial: ~30%
- Objetivo: Crear plan de implementación detallado por fases
- Output: Documento de plan en `thoughts/shared/plans/`
- Comando: `/stepwise-dev:create_plan @thoughts/shared/research/doc.md`
- Clave: Itera el plan 3-5 veces hasta que sea sólido
- Al terminar: `/clear`

**Implement (Implementar):**
- Contexto inicial: ~30%
- Objetivo: Ejecutar UNA fase del plan
- Output: Código funcionando y testeado
- Comando: `/stepwise-dev:implement_plan @thoughts/shared/plans/doc.md Phase 1 only`
- Si llegas al 60%: Para, `/clear`, continúa con siguiente fase
- Al terminar: `/clear`

**Validate (Validar):**
- Contexto inicial: ~30%
- Objetivo: Verificar que implementaste correctamente el plan
- Output: Reporte de validación
- Comando: `/stepwise-dev:validate_plan @thoughts/shared/plans/doc.md`
- Al terminar: `/clear`

## El ingrediente secreto: el directorio thoughts/

Aquí está la magia: **cada fase genera documentos que persisten entre sesiones**.

```
thoughts/
├── nikey_es/              # Tu espacio personal
│   ├── tickets/           # Tickets originales
│   └── notes/             # Notas rápidas, ideas
├── shared/                # Conocimiento del equipo
│   ├── research/          # Documentos de investigación
│   ├── plans/             # Planes de implementación
│   └── prs/               # Descripciones de PRs
└── searchable/            # Hardlinks para búsqueda rápida
```

**¿Por qué esto cambia todo?**

Porque convierte conocimiento temporal (dentro de una conversación) en conocimiento permanente (archivos en disco).

- **Ya no repites investigaciones:** Si investigaste cómo funciona la autenticación hace 3 semanas, ese documento sigue ahí. Lo referencias y sigues adelante.

- **Las decisiones quedan documentadas:** "¿Por qué descartamos usar Passport.js?" → Está en el research doc, líneas 45-67.

- **El equipo comparte contexto:** Todos tienen acceso a `shared/`. Las investigaciones de un desarrollador ayudan a todo el equipo.

- **Claude puede buscar eficientemente:** El directorio `searchable/` usa hardlinks para que las herramientas de búsqueda funcionen al instante.

## De caos a disciplina: un ejemplo real

**Antes (sin método):**
```
Usuario: "Implementa OAuth en la app"
[Claude carga 8 archivos]
[Lee 5 más durante la conversación]
[Implementa todo en una sesión de 90 minutos]
[Contexto al final: 87%]
[No hay documentación de decisiones]
[Dos semanas después: "¿Por qué no funciona el refresh token?"]
```

**Después (con stepwise-dev):**
```
Sesión 1 - Research (20 min, 45% contexto):
Usuario: /stepwise-dev:research_codebase "How does authentication work?"
[Claude investiga en paralelo con 5 agentes especializados]
Output: thoughts/shared/research/2025-11-13-oauth-implementation.md
[/clear]

Sesión 2 - Plan (30 min, 52% contexto):
Usuario: /stepwise-dev:create_plan @thoughts/shared/research/2025-11-13-oauth-implementation.md
[Itera el plan 4 veces con Claude]
Output: thoughts/shared/plans/2025-11-13-oauth-implementation.md
[/clear]

Sesión 3 - Implement Phase 1 (25 min, 58% contexto):
Usuario: /stepwise-dev:implement_plan @thoughts/shared/plans/2025-11-13-oauth-implementation.md Phase 1 only
Output: OAuth provider setup + tests passing
[/clear]

Sesión 4 - Implement Phase 2 (30 min, 54% contexto):
Usuario: /stepwise-dev:implement_plan @thoughts/shared/plans/2025-11-13-oauth-implementation.md Phase 2 only
Output: Refresh token logic + tests passing
[/clear]

Sesión 5 - Validate (15 min, 42% contexto):
Usuario: /stepwise-dev:validate_plan @thoughts/shared/plans/2025-11-13-oauth-implementation.md
Output: ✓ All phases implemented correctly
```

**Resultado:**
- 5 sesiones cortas y enfocadas en lugar de 1 sesión maratón
- Contexto nunca superó el 60%
- Cada decisión documentada
- Plan de implementación reutilizable
- Zero retrabajo

## Lo que realmente importa

No necesitas escribir mejores prompts. Necesitas gestionar mejor el contexto.

No necesitas que Claude sea más inteligente. Necesitas darle la información correcta en el momento correcto.

No necesitas generar más código. Necesitas generar código que puedas mantener.

**La diferencia entre código mantenible y código legacy no está en la calidad del código. Está en la calidad del proceso que lo generó.**

Stepwise-dev no es magia. Es disciplina aplicada a cómo trabajamos con LLMs.

- Research separado de implementación
- Plans iterados hasta que son sólidos
- Implementación por fases, nunca todo de golpe
- Validación sistemática al final
- Documentación automática de todo el proceso

Y todo sin superar el 60% de contexto. Nunca.

---

## Cómo empezar

**1. Instala stepwise-dev:**
```bash
# En Claude Code
/plugin marketplace add nikeyes/stepwise-dev
/plugin install stepwise-dev@stepwise-dev
# Reinicia Claude Code
```

**2. Empieza con una feature pequeña:**
No intentes cambiar todo tu workflow de golpe. Elige una feature sencilla y prueba el ciclo completo:
- `/stepwise-dev:research_codebase` → `/clear`
- `/stepwise-dev:create_plan` → `/clear`
- `/stepwise-dev:implement_plan` Phase 1 → `/clear`
- `/stepwise-dev:validate_plan`

**3. Observa tu contexto:**
Usa `/context` después de cada fase. Anota cuánto llegas a usar. Ajusta según tu proyecto.

**4. Itera tu workflow:**
Después de 2-3 features, reflexiona:
- ¿Dónde te atascastе?
- ¿Qué fase te resultó más útil?
- ¿Qué documentación generada reutilizaste?

---

## Reflexión final

La IA nos ha dado velocidad sobrehumana para escribir código. Pero la velocidad sin dirección es solo caos en cámara rápida.

**Context engineering no es una moda. Es la habilidad fundamental para trabajar con LLMs de forma profesional.**

Puedes seguir trabajando sin método: generando código rápido, llegando al 90% de contexto, y creando legacy code desde el día uno.

O puedes elegir la disciplina: research antes que código, planes antes que implementación, y validación antes que deploy.

La pregunta no es si usar IA para programar. La pregunta es si vas a usar IA con un método o solo con esperanza.

Stepwise-dev es un método. No el único, pero uno que funciona.

¿Cuál es el tuyo?

---

## Referencias
- [Avoiding Skill Atrophy in the Age of AI](https://addyo.substack.com/p/avoiding-skill-atrophy-in-the-age)
- [Effective context engineering for AI agents - Anthropic](https://www.anthropic.com/research/context-engineering)
- [Advanced Context Engineering for Agents - Dex Horthy, HumanLayer](https://www.youtube.com/watch?v=example)
- [I mastered the Claude Code workflow - Ashley Ha](https://medium.com/@ashleyha0317/example)
