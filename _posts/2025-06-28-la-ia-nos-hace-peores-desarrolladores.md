---
layout: post
title: ¿La IA nos hace peores desarrolladores?
categories:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
tags:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
published: false
---

> ”Es más fácil engañar a la gente que convencerla de que ha sido engañada”  - Mark Twain

GitHub Copilot me escribió un algoritmo de ordenamiento perfecto en 3 segundos. Claude Code me resolvió un bug que llevaba horas buscando. 
ChatGPT me explicó un concepto de arquitectura que no entendía.

*La IA me está haciendo más productivo que nunca.*

Pero hay un lado oscuro del que casi nadie habla en las conferencias tech ni en los posts de LinkedIn:
**¿Estamos perdiendo la esencia de lo que nos hace buenos programadores.?**

Después de varios meses observando mi comportamiento y el de otros compañeros, he comenzado a notar nos estamos volviendo muy dependientes de la IA y esto está erosionando nuestras habilidades fundamentales como desarrolladores.
Por ejemplo:
- ¿Has visto a un compañero usando código generado por IA que no entiende pero funciona? 
- ¿Has visto equipos que usan librerías sugeridas por IA sin evaluar si realmente las necesitan?
- ¿Te cuesta escribir código desde cero, sin un prompt que te dé el empujón inicial?
- ¿Has dejado de investigar los errores y solo preguntas a la IA: “¿cómo lo arreglo?"

Si es así, no estás solo.

## Síntomas de atrofia por uso de IA
### Evitar el debugging manual
Uno de los primeros síntomas que noté fue mi tendencia a saltar directamente a la IA cuando encontraba un error. 
En lugar de leer cuidadosamente el stack trace o usar el debugger paso a paso, mi primer instinto era copiar el error y decirle a la IA: "Fix it".
Esto estaba haciendo que dejara de entener realmente el problema y me estaba atrofiando una habilidad fundamental: 
- Interpretar y depurar los errores mi propio código.

### Generación pasiva de código
La facilidad para generar rápidamente código que funciona es una tentación muy peligrosa.
En estos meses he comprobado que si usa las IA para generar y generar el código del proyecto y no hay una gran intervencion por tu parte (mínimo 50%), el ´codigo rápidamente se degrada y se vuelve poco mantenible. En poco tiempo llegas a un punto en el que ni tú ni la IA sois capaces de modificar ese proyecto.
Usa la IA pero no dejes de ser tú el que lidera el diseño y los refactors.

### Olvido de conceptos básicos
¿Recuerdas la sintaxis exacta para hacer una petición HTTP en tu lenguaje favorito?
¿Recuerdas como crear una clase desde cero?
¿Ya no miras la documentaciòn para buscar la funcion que necesitas y se la pides a la IA?
La comodidad del autocompletado constante puede hacer que perdamos familiaridad con las herramientas básicas de nuestro oficio y que confiemos ciégamente en soluciones que 

### 🏗️ Arquitectura por prompts
Ya no diseñas sistemas. Los describes a la IA y ella te da componentes.
"Necesito un microservicio que maneje usuarios, con autenticación JWT, base de datos PostgreSQL, y API REST..."
Has dejado de diseñar para convertirte en traductor de requerimientos de lenguaje Humano a lenguaje "Prompt"

### Pérdida del placer por resolver problemas
Quizás el síntoma más preocupante es la pérdida de esa satisfacción única que viene de resolver un problema difícil por tu cuenta. Cuando nos acostumbramos a soluciones instantáneas, la frustración natural del debugging o el diseño se vuelve intolerable, y perdemos una de las recompensas más gratificantes de programar.


## 🧠 Checklist de Autoevaluación: ¿Estoy perdiendo habilidades?
Si te identificas con 4 o más de estos puntos, puede que sea momento de reflexionar sobre tu relación con la IA:

- [ ] Evito leer mensajes de error y voy directo a la IA
- [ ] Me cuesta interpretar stack traces o hacer debugging manual
- [ ] Copio código de la IA que no entiendo completamente
- [ ] No podría explicar por qué una solución funciona
- [ ] Ya no recuerdo cómo usar APIs básicas sin autocomplete
- [ ] Dependo de la IA para tareas básicas repetitivas (ej. crear una clase con un constructor, hacer una validación sencilla)
- [ ] Me frustra cuando la IA no da una solución rápida
- [ ] Evito diseñar sistemas complejos sin ayuda
- [ ] Siento que aprendo menos que antes
- [ ] Hace tiempo que no leo documentación o documentos técnicos. Prefiero pedirle resúmenes a la IA.


## ¿Cómo mantnego mis habilidades usando la IA?
### Sé crítico con la IA:
Trata el código generado con IA como si fuera tu compañero junior: revísadlo juntos.
- ¿Por qué esta solución y no otras?
- ¿Qué pasaría si los datos fueran diferentes?
- ¿Qué pasa con los casos extremos?
- ¿Podemos mejorar la mantenibilidad?


### Reserva tiempo para trabajar sin IA
Implementa "No-AI Days" una vez por semana. 
Durante estas sesiones, vuelve a lo básico: lee documentación, interpreta errores manualmente, y escribe código desde cero. 
Puede ser más lento, pero ejercitaras habilidades que seguirás necesitando aunque uses la IA. 

### Intenta resolver problemas por tu cuenta primero
Establece una regla personal: dedica 15-30 minutos a investigar un problema antes de recurrir a la IA. 
Este tiempo no es "perdido", es inversión en tu comprensión del problema y del proyecto.

### Revisa el código generado como código humano
Aplica los mismos estándares de code review que usarías con cualquier otro desarrollador. La IA puede escribir el código, pero nosotros somos responsables de mantenerlo.

### Busca un equilibrio sostenible
No se trata de rechazar la IA, se trata de usarla conscientemente. 
Las herramientas de IA son extraordinarias para:

- Acelerar tareas repetitivas y boilerplate
- Explorar enfoques alternativos a problemas conocidos
- Aprender nuevos frameworks o lenguajes
- Generar código a partir de tests que tú has diseñado 
- Generar documentación

El peligro surge cuando las usamos como sustituto del pensamiento crítico, no como complemento.

---

## Reflexión final
La pregunta es cómo usarla de manera que nos haga mejores desarrolladores, no más dependientes.

Puedes seguir el camino fácil: copiar, pegar, deployar, repetir. Es cómodo, es rápido, y funciona... hasta que no.
O puedes elegir el camino del desarrollador profesional: usar la IA como una herramienta poderosa mientras mantienes y desarrollas tus propias habilidades.

¿Quieres ser el programador que controla la IA, o el que necesita la IA para desarrollar?
El futuro de tu carrera depende de cómo respondas esa pregunta.


## Referencias
- [MIT - Your Brain on ChatGPT: Accumulation of Cognitive Debt when Using an AI Assistant for Essay Writing Task](https://arxiv.org/pdf/2506.08872v1)
- [Avoiding Skill Atrophy in the Age of AI](https://addyo.substack.com/p/avoiding-skill-atrophy-in-the-age)
- [¿Y si la Inteligencia Artificial nos hiciera más bobos?](https://www.articulo14.es/estilo-vida/y-si-la-inteligencia-artificial-nos-hiciera-mas-bobos-20250623.html)
- [Habréis leído muchas veces eso de "La IA hará más listos a los listos y más tontos a los tontos"](https://www.linkedin.com/posts/carlos-ortiz-startup-advisor_habr%C3%A9is-le%C3%ADdo-muchas-veces-eso-de-la-ia-activity-7344288227614167040-eSu5/)