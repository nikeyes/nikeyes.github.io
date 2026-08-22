---
layout: post
title: Una guía de pairing para hacer onboarding a juniors
categories:
  - aprendizaje
  - buenas prácticas
tags:
  - Pair Programming
  - Extreme Programming
  - Mentoring
  - Onboarding
  - Claude Code
  - buenas prácticas
lang: es
ref: guia-de-pairing-para-onboarding-de-juniors
published: false
---

> "No soy un gran programador; solo soy un buen programador con grandes hábitos." - Kent Beck

Ahora todo el mundo trabaja con IA, y casi siempre solo. Puedes pedirle al agente que te lleve la contraria, y lo hará durante un rato. Insiste, y acabará dándote la razón, contradiciendo lo que te decía dos mensajes antes.  
Los modelos están entrenados para ser complacientes. Tus compañeros no.

Por eso, cuando trabajas con juniors sigue siendo igual de importante **cómo les enseñas**, aunque sea con Claude Code o Codex delante.  
La herramienta cambia pero la transferencia de conocimiento no.

Estoy ayudando a un junior a entrar en el mundo del backend y estamos haciendo pairing. Pero no sabía qué era el pairing, así que he escrito esta guía con todas mis notas: una recopilación de muchos artículos, libros y conversaciones. Junto con las sesiones que hacemos. Espero que le sirva como un *from 0 to hero*.

Buena parte de lo que viene a continuación es copia, a veces casi literal, de [unas *Pairing Guidelines* que escribió Rubén Antón](https://docs.google.com/document/d/1dGyhrW-2ivwi0iVdmwJoi0-mhRtKOMQp5eBSYkUR0Ek/edit) y que me gustaron mucho hace años.

Por si os es útil en estos nuevos tiempos, la dejo aquí.

---

## Por qué hacer Pair Programming o Pairing

Hacer pairing sirve para **crear opciones, reducir riesgo y reducir retrabajo**.  
La discusión mientras se escribe el código es lo importante: llegar a un consenso obliga a tomar mejores decisiones, más alineamiento y menos errores.

Es una de las doce prácticas de Extreme Programming, y en términos de [*software economics*, de Luis Artola](https://leanpub.com/software-economics), es una de las herramientas de gestión del riesgo más potentes que tenemos: crea opciones, reduce complejidad y sube el bus factor.

Lo que nos llevamos, además del código:

- **Conocimiento repartido**, técnico y de negocio.
- **Prácticas y valores compartidos**: diseño, testing, pragmatismo, YAGNI, transparencia. Eso se transmite haciendo pairing, no en un documento.
- **Ownership repartido**: menos dependencia de los perfiles senior.
- **Onboarding inmediato**: quien entra ve código y aporta desde el primer día.
- **Un sitio seguro donde preguntar**: se aprende mucho más rápido cuando no te da vergüenza decir que no entiendes algo.

## Los dos roles

Los nombres vienen de los rallies. El driver toma la siguiente curva. El navigator (el copiloto) lee la carretera que viene y la canta.  
Ninguno de los dos gana la carrera solo.

- **Driver**: tiene el teclado. Trabaja en el paso en el que estáis ahora mismo. La sintaxis, la lógica, hacer que este test pase o que este paso funcione.
- **Navigator**: suelta el teclado. Trabaja un paso por delante. Hacia dónde va esto, qué va a doler dentro de diez minutos, qué habíais acordado hacer después.

Cambiáis de rol todo el rato. Cuatro cosas fáciles en las que os podéis equivocar:

- **Ninguno de los dos roles es el del senior.** Es un reparto de tareas, no una jerarquía. Los juniors también navegan.
- **El navigator no está corrigiendo erratas.** El pairing *es* la review, y por eso te ahorra la review de después: dos personas se pusieron de acuerdo sobre este código mientras se escribía, no dos días más tarde. Pero revisas decisiones, no pulsaciones. Un punto y coma que falta es cosa del compilador.
- **El driver no es un mecanógrafo.** No estás escribiendo al dictado. Si no entiendes lo que estás tecleando, para y pregunta. Eres tú quien va a tener que explicar este código mañana.
- **El navigator no está descansando.** No teclear no es mirar. Si te callas durante diez minutos, en la sesión solo hay una persona, no dos.

El navigator puede pensar porque está libre del teclado, y esa es toda la razón de que seáis dos.  
Los dos roles cansan, de formas distintas. Por eso se cambia a menudo.

## Antes de empezar la sesión es bueno definir lo siguiente

- **Objetivo**: ¿qué significa "hecho"?
- **Modo**: ¿aprendizaje o entrega ([ver abajo](#modos))?
- **Estilo**: strong-style, ping-pong o libre ([ver abajo](#estilos)).
- **Cadencia de cambio**: cada test en verde, o cada 25 minutos.
- **Agendas**: ¿cuánto tiempo vamos a hacer pairing de verdad? ¿En qué máquina?
- **Setup**: en la oficina usamos dos teclados, dos ratones y un ordenador, así nadie tiene que moverse para coger el relevo. En remoto, cualquier editor con colaboración en vivo o una pantalla compartida con control remoto: nosotros usamos [VS Code Live Share](https://visualstudio.microsoft.com/services/live-share/).

## Estés en el rol que estés

- Propón mejoras al sistema.
- Clarifica las ideas. Si no entiendes lo que ha dicho el otro, dilo en el momento. Muchos errores de diseño se evitan preguntando "¿a qué te refieres con eso?".
- Toma la iniciativa cuando el otro se atasca.

## Como driver

- Céntrate solo en el paso que estáis haciendo. De lo que viene después se encarga el navigator.
- Piensa en voz alta: qué vas a hacer, qué estás haciendo, qué acabas de hacer.
- **La prueba del relevo**: en cualquier momento deberías poder dejar de teclear y que tu pareja continúe.
- Pide el teclado cuando lo necesites. No pedirlo también es un error, y encima invisible.
- No conduzcas más rápido de lo que tu pareja puede seguir. Di cuando algo te esté frustrando.

## Como navigator

El driver mira el **cómo** y el **qué**. Tú miras el **qué** y el **por qué**.  
Solo compartís el medio.

<img src="{{ site.baseurl }}/images/2026-08-21-a-pairing-guide-for-onboarding-juniors-en/driver-navigator-what-how-why.png" alt="El driver centrado en el cómo y el qué, el navigator centrado en el qué y el por qué" style="max-height:400px; width:auto; height:auto;"/>

<small>Diagrama basado en <a href="https://www.thoughtworks.com/insights/blog/effective-navigation-in-pair-programming">Effective Navigation in Pair Programming</a> (ThoughtWorks).</small>

- **Mantén la lista de objetivos**: lo que os falta para terminar, desde el objetivo grande hasta el paso de ahora mismo. Cuando el driver cierra uno, tú ya sabes cuál es el siguiente.
- No entres en modo táctico. Los detalles son del driver.
- **Apúntalo, no lo digas ahora.** Escribe ideas y obstáculos, y sácalos cuando el objetivo actual esté cerrado. Si el driver está tecleando, no te puede escuchar.
- **Regla de los 5 segundos**: antes de señalar un error, espera. Puede que ya lo haya visto.
- **Intención -> Ubicación -> Detalle.** Ir siempre directo al detalle es micromanagement. Para en cuanto pueda seguir solo:
  - "vamos a extraer el cálculo del descuento"
  - "ese bloque de `calculateTotal`"
  - "líneas 20-26, Cmd+Alt+M"
- Habla en "nosotros", no en "yo" y "tú".
- Marca el rumbo: baby steps, YAGNI, KISS. El ciclo de TDD es tu responsabilidad: "empecemos con un test".
- Muchas interrupciones de bajo nivel significan que toca cambiar de rol.
- Coge papel y lápiz. Pseudocódigo, cajas y flechas. Cuando hacemos pairing en remoto usamos [Miro](https://miro.com/) o [Excalidraw](https://excalidraw.com/).

## Estilos

- **Ping-pong**: A escribe un test que falla, B lo hace pasar, B escribe el siguiente. El mejor por defecto con TDD: el cambio de rol va incorporado.
- **Strong-style**: "para que una idea pase de tu cabeza al ordenador tiene que pasar por las manos de otro". Quien tiene la idea *navega*; conduce el otro. Exige un driver que esté cómodo sin entenderlo todo aún. Muy bueno para transferir conocimiento, roza el micromanagement, no abuséis. El éxito es poder dejar de usarlo.
- **Libre**: el más cómodo y el más fácil de hacer mal.

## Modos

Acordadlo en voz alta. Si no, uno de los dos está enseñando mientras el otro intenta terminar.

- **Modo aprendizaje**: cambiamos productividad por transferencia de conocimiento. Driver = quien recibe el conocimiento.
- **Modo entrega**: cambiamos transferencia de conocimiento por productividad. Driver = quien más práctica tiene.

## Cuándo no hacer pairing

- Tarea trivial o mecánica: cualquiera de los dos podría hacerla solo, y no hay nada que aprender.
- Demasiadas incógnitas para los dos: haced un spike por separado, acordad antes las preguntas, y compartid los hallazgos.
- Alguien necesita tiempo a solas. Hay que dejarle hueco.
- Seguid sincronizando cuando os separéis. La tarea sigue siendo de los dos.

## Tiempo

- Pomodoro 25/5, **cambio de rol en el descanso**. Descanso largo cada cuatro.
- **Máximo 6 horas de pairing al día.** Ocho no es sostenible. En remoto es todavía menos: compartir pantalla y llamada todo el día cansa más que estar sentado al lado de alguien, así que 2-4 horas.
- Rotad parejas para repartir conocimiento, pero no por rotar. Cada rotación cuesta contexto, y el contexto perdido se convierte en retrabajo. Así que rotad de uno en uno: quien se queda pasa lo que no está escrito en ningún sitio.
- Al final del día, una mini retro de dos minutos. ¿Hemos cambiado de rol lo suficiente? ¿Qué cambiaríamos mañana? Convertidlo en rutina antes de que algo vaya mal.

## Errores comunes

- Empezar sin un objetivo claro.
- Monopolizar el teclado, o no pedirlo nunca.
- No dejar que tu pareja acabe la frase.
- Estar cómodo solo escribiendo, o solo leyendo.
- No cambiar nunca, no descansar nunca.
- Cambiar de modo sin decirlo.
- Un navigator que se calla: normalmente se ha roto la comunicación, no el interés. Probad strong-style.
- Contestar o mirar Slack en mitad de la sesión.

## Conclusiones

Nada de esto es una técnica nueva: es lo de siempre, dos personas poniéndose de acuerdo sobre el código mientras lo escriben. Lo que ha cambiado es que nunca ha sido tan fácil pasarte el día entero escribiendo código con un agente que en realidad nunca te lleva la contraria.  
Si trabajas con un junior, llevar la contraria es justo lo que le tienes que enseñar a hacer.

---

## Referencias

- [Software economics](https://leanpub.com/software-economics) (Luis Artola. El marco de coste/valor/riesgo/deuda, en castellano)
- [The Costs and Benefits of Pair Programming](https://www.cs.utexas.edu/~ans/classes/cs439/projects/XPSardinia.PDF) (Cockburn & Williams. El estudio del 15%)
- [Pair Programming vs. Solo Programming: What Do We Know After 15 Years of Research?](https://ieeexplore.ieee.org/document/7427855/) (meta-análisis)
- [On Pair Programming](https://martinfowler.com/articles/on-pair-programming.html) (Böckeler y Siessegger. El tratamiento más completo)
- [Effective Navigation in Pair Programming](https://www.thoughtworks.com/insights/blog/effective-navigation-in-pair-programming) (ThoughtWorks. Pila de objetivos, comunicar la intención)
- [Strong-Style Pairing](http://llewellynfalco.blogspot.com/2014/06/llewellyns-strong-style-pairing.html) (Falco)
- [Experimento de rotación de parejas](https://martinfowler.com/articles/rotate-pairs-experiment.html)
- Kent Beck, *XP Explained*
- [Pair Programming: mi guía práctica](http://juandavidvega.es/2015/11/08/pair-programming-mi-guia-practica/) (Juan David Vega)
- [Productive pair programming](http://www.carlosble.com/2015/07/productive-pair-programming/) (Carlos Blé)
- [Pairing Guidelines](https://docs.google.com/document/d/1dGyhrW-2ivwi0iVdmwJoi0-mhRtKOMQp5eBSYkUR0Ek/edit) (Rubén Antón. La base de buena parte de esta guía)

---

Si quieres comentar algo, puedes escribirme directamente en [LinkedIn](https://www.linkedin.com/in/jorge-castro-nistal), [X](https://x.com/nikey_es), [Bluesky](https://bsky.app/profile/nikeyes.bsky.social) o [GitHub](https://github.com/nikeyes).

