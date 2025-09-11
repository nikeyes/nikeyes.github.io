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

Podemos generar 1000 líneas en una hora, pero validar si sirven para algo lleva semanas. El cuello de botella sigue siendo el mismo: **saber qué desarrollar**.

## El problema no es nuevo (pero se ha amplificado)

Extreme Programming (XP) nació en los años 90 con un objetivo claro: evitar que el código crezca más rápido que nuestra capacidad de validarlo. Por eso XP insiste en ciclos cortos, pruebas constantes y feedback continuo.

Si no ponemos frenos a la IA, se convierte en una máquina de generar entropía. Genera capas y capas de lógica sin validar en el mercado, añade suposiciones y una complejidad arquitectónica que crece de forma exponencial. El resultado es un código frágil, enredado y cada vez más caro de modificar.

Según [AI Copilot Code Quality, de GitClear (2025)](https://www.gitclear.com/ai_assistant_code_quality_2025_research), la frecuencia de los bloques de código con más de 5 líneas duplicadas se multiplicó por ocho durante 2024.

Estamos construyendo castillos de naipes a la velocidad de la luz.

## ¿Y si dejamos que la IA lo arregle todo?

Aquí viene la ironía: las herramientas de IA funcionan mejor en código limpio, bien documentado y bien estructurado.
Si usas la IA sin disciplina, creas un código base caótico. Ese mismo caos hace que la IA sea cada vez menos efectiva, hasta que ni ella ni los humanos entiendan qué está pasando.

Has invertido en un Ferrari para conducirlo por un atasco infinito.

## La solución no es más velocidad, sino mejores frenos

Si crear código más rápido no nos da mejor software, la respuesta no es acelerar más, sino aplicar restricciones inteligentes. 

Aquí es donde los principios de XP se vuelven imprescindibles. 
XP nunca buscó maximizar la producción. XP introdujo fricciones deliberadas para forzar el aprendizaje y la alineación.

XP es simple pero poderoso: ve más despacio en lo pequeño para poder ir más rápido en lo grande.
Invierte tiempo en prácticas que parecen "lentas" a corto plazo, como TDD, pair programming, refactoring constante y entregas pequeñas, para ganar velocidad exponencial en el medio/largo plazo: menos bugs en producción, menor deuda técnica y prácticamente cero retrabajo.

Es importante recordar que:
- **Pair programming** crea consenso, duplica conocimiento y saca a la luz suposiciones ocultas. Es una inversión en aprendizaje, no en producción en masa de código.  
- La **simplicidad** es el arte de maximizar el trabajo no realizado porque cada línea de código tiene coste de mantenimiento.
- El **feedback continuo** es la única forma de saber si vamos en la dirección correcta. La velocidad es inútil sin bucles de feedback.
    
## Detrás de cada producto exitoso hay conversaciones, no solo código

A pesar del auge de la IA, los obstáculos para entregar valor siguen siendo los mismos:
- Alineación
- Contexto compartido
- Claridad en los objetivos
- Validación con el usuario.

Desarrollar software va de personas, no solo de código. Necesitamos marcos que nos anclen a prácticas centradas en las personas. XP nos da disciplina y empatía: pone al equipo en el centro y eleva el entendimiento compartido por encima de la velocidad bruta.

## Deuda técnica = bloqueador de IA  

El código legacy no es solo "difícil de mantener", es incompatible con la IA. Una base de código limpio, bien estructurada y modular es el prerrequisito para la integración efectiva de herramientas de IA. La refactorización ya no es opcional.

## El rol del senior developer evoluciona

Ahora somos los que tenemos que equilibrar entre la velocidad de la IA y la calidad del producto.
Y vamos a necesitar nuevas habilidades:
- **AI Whisperer**: Saber cómo comunicarte de forma efectiva con las herramientas de IA
- **AI Quality Gatekeeper:** Distinguir entre código que funciona y código mantenible. La IA puede resolver el problema inmediato, pero tú decides si la solución será mantenible en 6 meses.
- **AI System Designer:** Diseña para que los humanos y la IA puedan colaborar y crear estructuras donde la IA potencie al equipo sin crear dependencias imposibles de mantener por los humanos.

## Lo que realmente importa

Con la IA puedes generar soluciones brillantes en minutos, pero también crear problemas imposibles de resolver en segundos.

La experiencia humana sigue siendo crucial.

Necesitamos disciplina sobre velocidad, claridad sobre cantidad y, por encima de todo, personas sobre código.
Y recuerda que con IA o sin IA, la pregunta más importante sigue siendo la misma: **¿Estamos construyendo lo correcto?**

Estos principios no son nuevos, pero su relevancia es mayor que nunca. Considerémoslos un **manifiesto para navegar en la era de la IA**.

*Referencias:*
- [The Nature of Software Development](https://pragprog.com/titles/rjnsd/the-nature-of-software-development/)
- [El coste basal del software](https://www.eferro.net/2024/07/el-coste-basal-del-software.html)
- [Complejidad Accidental](https://medium.com/@pedromcarrion/complejidad-accidental-10f176632c10)
- [AI Copilot Code Quality, de GitClear (2025)](https://www.gitclear.com/ai_assistant_code_quality_2025_research)
- [Should we revisit Extreme Programming in the age of AI?](https://www.hyperact.co.uk/blog/should-we-revisit-xp-in-the-age-of-ai)
- [DORA - Impact of Gen AI in Software Development](https://dora.dev/research/ai/#impact-of-gen-ai-in-software-development)
- [Extreme Programming Explained: Embrace Change](https://www.amazon.com/Extreme-Programming-Explained-Embrace-Change/dp/0321278658)


