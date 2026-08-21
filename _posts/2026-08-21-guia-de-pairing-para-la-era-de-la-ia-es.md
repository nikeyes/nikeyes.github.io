---
layout: post
title: Guía de pairing para la era de la IA
categories:
  - aprendizaje
  - buenas prácticas
  - Desarrollo guiado por IA
tags:
  - Pair Programming
  - Extreme Programming
  - Mentoring
  - Claude Code
  - buenas prácticas
lang: es
ref: guia-de-pairing-para-la-era-de-la-ia
published: false
---

Ahora todo el mundo trabaja con IA, y casi siempre solo.

Pero cuando trabajas con juniors sigue siendo igual de importante **cómo les enseñas**, aunque sea con Claude Code o Codex delante. La herramienta cambia; la transferencia de conocimiento no.

Estoy ayudando a un junior a entrar en el mundo del backend y estamos haciendo pairing. Pero no sabía qué era el pairing, así que le escribí esta guía con todas mis notas: una recopilación de muchos artículos, libros y conversaciones. Junto con las sesiones que hacemos, le sirve como un *from 0 to hero*.

Una parte importante de lo que viene a continuación es copia — a veces casi literal — de [unas *Pairing Guidelines* que escribió Rubén Antón](https://docs.google.com/document/d/1dGyhrW-2ivwi0iVdmwJoi0-mhRtKOMQp5eBSYkUR0Ek/edit) y que me gustaron mucho hace años.

Por si os es útil en estos nuevos tiempos, la dejo aquí.

---

## Por qué

"Pairear" sirve para **crear opciones, reducir riesgo y reducir retrabajo**. La discusión mientras se escribe el código es lo importante: llegar a un consenso obliga a tomar mejores decisiones, más alineamiento y menos errores.

Es una de las doce prácticas de Extreme Programming, y en términos de [*software economics*](https://leanpub.com/software-economics) (Artola) es una de las herramientas de gestión del riesgo más potentes que tenemos: crea opciones, reduce complejidad y sube el bus factor.

Lo que nos llevamos, además del código:

- **Conocimiento repartido**, técnico y de negocio.
- **Prácticas y valores compartidos** — diseño, test, pragmatismo, YAGNI, transparencia. Eso se transmite paireando, no en un documento.
- **Ownership repartido**: menos dependencia de los perfiles senior.
- **Onboarding inmediato**: quien entra ve código y aporta desde el primer día.
- **Sin presión sobre el otro**: nadie debería salir de una sesión más tenso de lo que entró.

## Antes de empezar

- **Objetivo** — ¿qué significa "hecho"?
- **Modo** — ¿aprendizaje o entrega? (ver abajo)
- **Estilo** — strong-style, ping-pong o libre.
- **Cadencia de cambio** — cada test en verde, o cada 25 min.
- **Agendas** — ¿cuánto tiempo vamos a pairear de verdad? ¿En qué máquina?

## La pareja debe

- Ayudarse a mantener el foco en el paso actual.
- Proponer mejoras al sistema, clarificar ideas.
- Tomar la iniciativa cuando el otro se atasca.
- Adoptar ambos roles. Estar igual de cómodos leyendo que escribiendo.

## Como driver

- Céntrate en el objetivo pequeño. El horizonte lo lleva el navigator.
- Piensa en voz alta: qué vas a hacer, qué estás haciendo, qué acabas de hacer.
- **Prueba del relevo:** en cualquier momento deberías poder dejar de teclear y que tu pareja continúe.
- Pide el teclado cuando lo necesites. No pedirlo también es un error — y encima invisible.
- No conduzcas más rápido de lo que tu pareja puede seguir. Di cuando algo te está frustrando.

## Como navigator

- **Mantén la pila de objetivos**: la lista ordenada de pasos hasta terminar. Es lo que fija el nivel de abstracción en el que trabajáis los dos.
- No entres en modo táctico. Los detalles son del driver; lo tuyo es el medio plazo.
- **Apunta, no sueltes.** Escribe ideas y obstáculos; sácalos cuando el objetivo actual esté cerrado. Si el driver está tecleando, no te puede escuchar.
- **Regla de los 5 segundos:** antes de señalar un error, espera. Puede que ya lo haya visto.
- **Intención → Ubicación → Detalle.** Para en cuanto pueda seguir solo: "vamos a extraer el cálculo del descuento" / "ese bloque de `calculateTotal`" / "líneas 20-26, Cmd+Alt+M". Ir siempre directo al detalle es micromanagement.
- Habla en "nosotros", no en "yo" y "tú".
- Marca el rumbo: baby steps, YAGNI, KISS. El ciclo de TDD es tu responsabilidad — "empecemos con un test".
- Muchas interrupciones de bajo nivel = toca cambiar de rol, no es algo que gestionar.
- Coge papel y lápiz. Pseudocódigo, cajas y flechas.

## Estilos

- **Ping-pong** — A escribe un test que falla, B lo hace pasar, B escribe el siguiente. El mejor por defecto con TDD: el cambio de rol va incorporado.
- **Strong-style** — "para que una idea pase de tu cabeza al ordenador tiene que pasar por las manos de otro". Quien tiene la idea *navega*; el novato conduce. Exige que el driver esté cómodo sin entenderlo todo aún — los "por qué" se discuten después. Muy bueno para transferir conocimiento, roza el micromanagement, no abusar. El éxito es poder dejar de usarlo.
- **Libre** — el más cómodo y el más fácil de hacer mal.

## Modos

Decidlo en voz alta; el fallo es que cada uno optimice para algo distinto.

- **Aprendizaje** — cambiamos productividad por transferencia. Driver = quien recibe el conocimiento.
- **Entrega** — cambiamos transferencia por productividad. Driver = quien más práctica tiene.

## Cuándo no pairear

- Tarea trivial o mecánica, cualquiera podría hacerla solo, y no hay nada que aprender. Ojo: el trabajo repetitivo puede ser síntoma de mal diseño.
- Demasiadas incógnitas para los dos → spike por separado, acordad antes las preguntas, y compartid los hallazgos.
- Alguien necesita tiempo a solas. Hay que dejarle hueco.
- **Seguid paireando** en problemas difíciles (sacáis una solución) y en los fáciles pero importantes (de ahí sale la innovación).
- Si os separáis, seguid sincronizando. La historia sigue siendo de los dos.

## Tiempo

- Pomodoro 25/5, **cambio de rol en el descanso**. Descanso largo cada cuatro.
- **Máximo 6h de pairing al día.** Ocho no es sostenible.
- Rotad parejas para repartir conocimiento, pero no por rotar: cada rotación cuesta onboarding y un cambio de contexto, y perder conocimiento tácito genera justo el retrabajo que queremos evitar. Dejad un ancla en la historia.
- Al final del día, mini-retro de dos minutos. ¿Hemos cambiado de rol lo suficiente? ¿Qué cambiaríamos mañana? Convertidlo en rutina antes de que algo vaya mal.

## Errores comunes

- Empezar sin un objetivo claro.
- Monopolizar el teclado, o no pedirlo nunca.
- No dejar que tu pareja acabe la frase.
- Estar cómodo solo escribiendo, o solo leyendo.
- No cambiar nunca, no descansar nunca.
- Ir cambiando de modo sin decirlo.
- Un navigator que se calla: normalmente se ha roto la comunicación, no el interés. Probad strong-style.
- Móvil y correo en mitad de la sesión.

## Con un asistente de IA

Casi todo aplica igual: escribe la especificación antes de pedir código, tú navegas y él conduce, y la prueba del relevo sigue valiendo — si no sabrías explicar el diff, no tienes código que funciona.

Lo que no te da es el consenso del principio: te va a dar la razón encantado.

## Conclusión

La dificultad está en conocer a tu pareja lo suficiente para darte cuenta de cuándo estáis paireando mal. No hay una única forma correcta — la única prueba es si estáis obteniendo los beneficios. Si no, cambiad algo.

---

## Anexo: qué dice la evidencia

Para cuando alguien pregunte si esto sale a cuenta. Conviene usarlo con honestidad, porque la evidencia es más floja de lo que se suele citar.

**El dato central** (Cockburn & Williams, XP2000, experimento de la Universidad de Utah): pairear cuesta **~15% más de tiempo** — no el doble, como diría la intuición — y produce **~15% menos defectos**.

**Por qué ese 15% se recupera**, con el ejemplo del propio paper: 50.000 líneas a 50 LOC/hora son 1.000 horas en solitario y 1.150 en pareja, o sea 150 horas de coste. Si esos 225 defectos extra los encuentra testing, a 10 h/defecto son 2.250 horas: **15× el coste del pairing**. Si llegan a producción, a 40 h/defecto son 9.000 horas: **60×**. Ese es nuestro "reducir retrabajo", cuantificado.

**Avisos, si vamos a citar esto:**

- Los estudios no coinciden. Hay resultados de −29%, −52% de tiempo, ninguna diferencia, y un meta-análisis de 15 estudios que no encuentra diferencia significativa en duración. El 40-50% que circula sale de un experimento con 41 estudiantes y cuatro ejercicios cortos.
- El "estudio de la NASA" (Wood & Kleb, *Exploring XP for scientific research*) no mide productividad del pairing: es un piloto de XP en investigación, y el pairing fue justamente la práctica que no pudieron aplicar. No lo usemos.
- Cualquier experimento sobre productividad en desarrollo es fácil de rebatir: hay demasiada incertidumbre y demasiado resultado no medible. **Lo que convence es demostrar que funciona aquí.** Midamos nuestro propio retrabajo.

---

## Enlaces

- [Software economics](https://leanpub.com/software-economics) (Luis Artola — el marco de coste/valor/riesgo/deuda, en castellano)
- [The Costs and Benefits of Pair Programming](https://www.cs.utexas.edu/~ans/classes/cs439/projects/XPSardinia.PDF) (Cockburn & Williams — el estudio del 15%)
- [Pair Programming vs. Solo Programming: What Do We Know After 15 Years of Research?](https://ieeexplore.ieee.org/document/7427855/) (meta-análisis)
- [On Pair Programming](https://martinfowler.com/articles/on-pair-programming.html) (Böckeler y Siessegger — el tratamiento más completo)
- [Effective Navigation in Pair Programming](https://www.thoughtworks.com/insights/blog/effective-navigation-in-pair-programming) (ThoughtWorks — pila de objetivos, comunicar la intención)
- [Strong-Style Pairing](http://llewellynfalco.blogspot.com/2014/06/llewellyns-strong-style-pairing.html) (Falco)
- [Experimento de rotación de parejas](https://martinfowler.com/articles/rotate-pairs-experiment.html)
- Kent Beck, *XP Explained*
- [Pair Programming: mi guía práctica](http://juandavidvega.es/2015/11/08/pair-programming-mi-guia-practica/) (Juan David Vega)
- [Productive pair programming](http://www.carlosble.com/2015/07/productive-pair-programming/) (Carlos Blé)
- [Pairing Guidelines](https://docs.google.com/document/d/1dGyhrW-2ivwi0iVdmwJoi0-mhRtKOMQp5eBSYkUR0Ek/edit) (Rubén Antón — la base de buena parte de esta guía)

---

Si quieres comentar algo, puedes escribirme directamente en [LinkedIn](https://www.linkedin.com/in/jorge-castro-nistal), [X](https://x.com/nikey_es), [Bluesky](https://bsky.app/profile/nikeyes.bsky.social) o [GitHub](https://github.com/nikeyes).
