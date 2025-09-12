---
layout: post
title: El código generado con IA necesita frenos, no acelerador
categories:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
tags:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
lang: es
ref: ai-code-brakes
published: true
---

> ”Nada resulta tan inútil como hacer con eficiencia lo que nunca debió hacerse.”  - Peter Drucker

La IA nos ha dado una velocidad sobrehumana para crear código, pero seguimos entregando proyectos mediocres. Hemos confundido la **capacidad de generar código** con la **capacidad de entregar valor**.

Podemos generar 1000 líneas en una hora, pero validar si sirven para algo lleva semanas. El cuello de botella sigue siendo el mismo: **saber cuál es el siguiente incremento que nos acerca a nuestros objetivos**.

## El problema no es nuevo (pero se ha amplificado)

[Extreme Programming (XP)](https://www.geeksforgeeks.org/software-engineering/software-engineering-extreme-programming-xp/) nació en los años 90 con un objetivo claro: evitar que el código crezca más rápido que nuestra capacidad de validarlo. Por eso XP insiste en ciclos cortos, pruebas constantes y feedback continuo.

Si no ponemos frenos a la IA, se convierte en una máquina de generar desperdicio. Genera capas y capas de lógica sin validar en el mercado, añade suposiciones y una complejidad arquitectónica que crece de forma exponencial. El resultado es un código frágil, enredado y cada vez más caro de modificar.

Según [AI Copilot Code Quality, de GitClear (2025)](https://www.gitclear.com/ai_assistant_code_quality_2025_research), la frecuencia de los bloques de código con más de 5 líneas duplicadas se multiplicó por ocho durante 2024.

Estamos construyendo castillos de naipes a la velocidad de la luz.

## ¿Y si dejamos que la IA lo arregle todo?

Aquí viene la ironía: las herramientas de IA funcionan mejor en código limpio, bien documentado y bien estructurado. Les proporciona un contexto claro y de alta calidad para entender la intención del desarrollador y generar resultados precisos y coherentes.  
Además, [el último estudio de Sonar](https://arxiv.org/abs/2508.14727) concluye que todos los modelos de IA evaluados (incluyendo Claude Sonnet 4, GPT-4o, y Llama) siempre introducen bugs, vulnerabilidades de seguridad y problemas de mantenibilidad o "code-smells".

![distribution_of_issue_types_by_LLM.png]({{ site.baseurl }}/images/2025-09-11-el-codigo-generado-con-ia-necesita-frenos-no-acelerador/distribution_of_issue_types_by_LLM.png)

Esto confirma lo que muchos ya intuimos: **la IA es fantástica resolviendo el problema de hoy, pero terrible preparando el código para mañana.**

Si usas la IA sin disciplina, crearás un código base caótico. Ese mismo caos hace que la IA sea cada vez menos efectiva, hasta que ni ella ni los humanos entiendan qué está pasando.

Has invertido en un Ferrari para conducirlo por un atasco que tú mismo estás creando.

## La solución no es más velocidad, sino mejores frenos

Si crear código más rápido no nos da mejor software, la respuesta no es acelerar más, sino aplicar restricciones inteligentes. 

Aquí es donde los principios de XP se vuelven imprescindibles. 
XP nunca buscó maximizar la producción. XP introdujo fricciones deliberadas para forzar el aprendizaje y la alineación.

XP es simple pero poderoso: ve más despacio en lo pequeño para poder ir más rápido en lo grande.

## ¿Dónde está realmente el valor?

La IA es brillante resolviendo problemas ya resueltos: autenticación, CRUD, backoffices, etc. Pero el valor de tu producto no está en el boilerplate.

El valor está en:
- Las reglas de negocio específicas de tu dominio
- El conocimiento único que tu equipo tiene sobre tus usuarios
- La complejidad inherente del problema que resuelves

Estos son exactamente los elementos que la IA no puede generar porque no existen en Stack Overflow. Son únicos de tu contexto, y aquí es donde tu experiencia humana es insustituible.

Invierte tiempo en prácticas que parecen "lentas" a corto plazo, como TDD, pair programming, refactoring constante y entregas pequeñas, para ganar velocidad exponencial en el medio/largo plazo: menos bugs en producción, menor deuda técnica y prácticamente cero retrabajo.

Es importante recordar que:
- **Pair programming** crea consenso, duplica conocimiento y saca a la luz suposiciones ocultas. Es una inversión en aprendizaje, no en producción en masa de código.  
- La **simplicidad** es el arte de maximizar el trabajo no realizado porque cada línea de código tiene coste de mantenimiento.
- El **feedback continuo** es la única forma de saber si vamos en la dirección correcta. La velocidad es inútil sin bucles de feedback.
    
## Detrás de cada producto exitoso hay conversaciones, no solo código

A pesar del auge de la IA, los obstáculos para entregar valor siguen siendo los mismos:
- **Alineación**: mantener el equipo sincronizado ante cambios de prioridades.
- **Contexto compartido**: asegurar que todos entiendan el problema y su evolución.
- **Claridad en los objetivos**: definir metas que puedan ajustarse según el aprendizaje.
- **Validación con el usuario**: iterar continuamente basándose en feedback real.
- **Adaptabilidad constante**: modificar enfoques y decisiones cuando las circunstancias cambian.

Desarrollar software va de personas, no solo de código.  
Necesitamos marcos que nos guíen a prácticas centradas en las personas.  
XP nos da disciplina y empatía: pone al equipo en el centro y eleva el entendimiento compartido por encima de la velocidad bruta.


## El rol del senior developer evoluciona

Ahora somos los que tenemos que equilibrar entre la velocidad de la IA y la calidad del producto.
Y vamos a necesitar nuevas habilidades:
- **AI Whisperer**: Saber cómo comunicarte de forma efectiva con las herramientas de IA
- **AI Quality Gatekeeper:** Distinguir entre código que funciona y código mantenible. La IA puede resolver el problema inmediato, pero tú decides si la solución será mantenible en 6 meses.
- **AI System Architect:** Diseña sistemas donde humanos e IA colaboren de forma sostenible, creando arquitecturas que potencien al equipo sin generar dependencias imposibles de mantener.


## Lo que realmente importa

Con la IA puedes generar soluciones brillantes en minutos, pero también crear grandes problemas en segundos.

La experiencia humana sigue siendo crucial.

Necesitamos disciplina sobre velocidad, claridad sobre cantidad y, por encima de todo, personas sobre código.  

Y recuerda que con IA o sin IA, la pregunta más importante sigue siendo la misma: **¿Estamos construyendo lo correcto?**

Estos principios no son nuevos, pero su relevancia es mayor que nunca. Considerémoslos un **manifiesto para navegar en la era de la IA**.

---

*"Vale, pero ¿cómo aplico estos frenos en mi día a día?"*

Si os interesa el tema, compartiré consejos prácticos sobre como implementar estos frenos.

Porque una cosa es saber que necesitas frenos, y otra muy distinta es saber cómo y cuándo pisarlos.

## Esta artículo es mucho mejor gracias al feedback de
- [heedrox/itortv](https://bsky.app/profile/heedrox.bsky.social)
- [Edu Ferro](https://bsky.app/profile/eferro.net)

### *Referencias:*
- [The Nature of Software Development](https://pragprog.com/titles/rjnsd/the-nature-of-software-development/)
- [El coste basal del software](https://www.eferro.net/2024/07/el-coste-basal-del-software.html)
- [Complejidad Accidental](https://medium.com/@pedromcarrion/complejidad-accidental-10f176632c10)
- [AI Copilot Code Quality, de GitClear (2025)](https://www.gitclear.com/ai_assistant_code_quality_2025_research)
- [Should we revisit Extreme Programming in the age of AI?](https://www.hyperact.co.uk/blog/should-we-revisit-xp-in-the-age-of-ai)
- [DORA - Impact of Gen AI in Software Development](https://dora.dev/research/ai/#impact-of-gen-ai-in-software-development)
- [Extreme Programming Explained: Embrace Change](https://www.amazon.com/Extreme-Programming-Explained-Embrace-Change/dp/0321278658)
- [What is Extreme Programming (XP)?](https://www.geeksforgeeks.org/software-engineering/software-engineering-extreme-programming-xp/)
- [Extreme Programming: A gentle introduction](http://www.extremeprogramming.org/)
- [Assessing the Quality and Security of AI-Generated Code: A Quantitative Analysis](https://arxiv.org/abs/2508.14727)
