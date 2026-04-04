---
layout: post
title: El desarrollador ya no escribe código, diseña la fábrica que lo construye
categories:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
tags:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
  - Futuro del desarrollador
  - Service as Software
  - Agentes de IA
lang: es
ref: el-desarrollador-ya-no-escribe-codigo-disena-la-fabrica-que-lo-construye
published: false
---

> "Cuando cualquiera puede construir cualquier cosa, saber qué merece ser construido se convierte en la habilidad clave." - Kent Beck

Llevo meses sin escribir una línea de código a mano. Todo lo implementa la IA. Y no soy el único, el [84% de los desarrolladores ya usa IA en su trabajo](https://survey.stackoverflow.co/2025/ai) 

Si generar código ya no es un problema, **¿a qué se tiene que dedicar un desarrollador?**

## Tu valor ya no está en escribir código

Los equipos con alta adopción de IA fusionan un [98% más de PRs](https://www.faros.ai/blog/ai-software-engineering), pero el tiempo de revisión sube un 91% y los bugs por desarrollador crecen un 9%. Más output, mismos problemas.

La IA no funciona sola. El [estudio de METR](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/) de principios de 2025 mostró que desarrolladores experimentados tardaron un 19% más con IA. Pero usaron Cursor Pro directamente, sin preparar los repos, sin context engineering, sin reglas, sin hooks. Así cualquier herramienta rinde mal. Tienes que configurar tu entorno para que la IA trabaje bien.

Generar código es trivial. Que ese código sea correcto y mantenible requiere invertir tiempo y esfuerzo en crear el sistema que lo produce.

## Tres cosas a las que dedicarte

### 1. Diseña el sistema que verifica, no verifiques tú - Arquitecto de Guardaraíles

[Martin Fowler](https://martinfowler.com/articles/exploring-gen-ai/humans-and-agents.html) distingue entre estar **en** el loop (revisas cada línea, que es insostenible) y estar **sobre** el loop (diseñas el sistema que revisa por ti). Lo llama Harness Engineering.

En la práctica esto es: linting automático, tests que ejecuta el propio agente en su loop, mutation testing como red de seguridad real, y LLM-as-judge, una IA evaluando el output de otra. 
[Addy Osmani](https://addyosmani.com/blog/factory-model/) lo resume muy bien: tu trabajo ya no es escribir código, es construir la fábrica que lo construye.

Tu responsabilidad pasa de revisar PRs a **diseñar los controles que hacen la revisión innecesaria**.

### 2. Define el qué, deja el cómo al agente - Ingeniero de especificaciones

Cada vez más, el trabajo real del desarrollador es escribir buenas especificaciones: qué tiene que hacer esto, qué restricciones tiene, cómo sé que está bien hecho. El agente se encarga del cómo. La revisión deja de ser de código y pasa a ser de especificaciones.

Kent Beck habla de [deflación de la programación](https://tidyfirst.substack.com/p/programming-deflation) y lo explica de forma muy clara: programar se está abaratando, como cuando un producto baja de precio. Lo que no se abarata es todo lo demás. Entender el problema, saber descomponerlo, tener criterio para decidir qué construir y qué no.
Esas habilidades ahora valen más que nunca, precisamente porque el código ya no es lo escaso.

### 3. Habilita que otros construyan - Habilitador de plataforma

El cambio más radical: el desarrollador no programa el código del producto, se convierte en **habilitador**. Tiene que crear una "platform team" que pone herramientas, automatizaciones y guardarraíles para que POs, PMs y diseñadores puedan construir directamente.

Andrew Ng ya lo vive: [el ratio de 6 ingenieros por PM se está invirtiendo en algunos de sus equipos](https://bagel.ai/blog/andrew-ng-is-right-product-management-is-the-bottleneck-heres-what-comes-next/). El cuello de botella se ha movido de implementar a definir. Ya no hablamos de developer experience, sino de **builder experience**. 