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

Llevo meses escribiendo mucho menos código del que escribía antes. No cero, pero sí lo suficiente como para darme cuenta de algo incómodo: cada vez importa menos. Y no soy el único, el [84% de los desarrolladores ya usa IA en su trabajo o plantea usarla en breve](https://survey.stackoverflow.co/2025/ai).  

Si generar código ya no es un problema, **¿a qué se tiene que dedicar un desarrollador?**

## Tu valor ya no está en escribir código

Hay algo curioso pasando en equipos que adoptan IA fuerte: producen más, pero no necesariamente mejor.  
Más PRs, más velocidad… pero también más revisión, más fricción, y a veces más bugs.
No porque la IA sea mala, sino porque **acelera justo la parte que ya no era el problema**.
El problema nunca fue escribir líneas de código.
El problema es decidir qué construir, cómo validarlo y cómo mantenerlo bajo control.

La IA no funciona sola. El [estudio de METR](https://metr.org/blog/2025-07-10-early-2025-ai-experienced-os-dev-study/) de principios de 2025 mostró que desarrolladores experimentados tardaron un 19% más con IA. Pero usaron Cursor Pro directamente, sin preparar los repos, sin context engineering, sin reglas, sin hooks. Así cualquier herramienta rinde mal.  
Tienes que configurar tu entorno para que la IA trabaje bien.

Escribir código ya es trivial en muchos casos. Que ese código sea correcto y mantenible requiere invertir tiempo y esfuerzo en crear el sistema que lo genera.

## Tres cosas a las que dedicarte si eres desarrollador

### 1. Arquitecto de Guardarraíles: diseña el sistema que verifica, no verifiques tú

[Martin Fowler](https://martinfowler.com/articles/exploring-gen-ai/humans-and-agents.html) distingue entre estar **en** el loop (revisas cada línea, que es totalmente insostenible) y estar **sobre** el loop (diseñas el sistema que revisa por ti). Lo llama Harness Engineering.

En la práctica esto es: linting automático, tests que ejecuta el propio agente en su loop, mutation testing como red de seguridad real, y LLM-as-judge, una IA evaluando el output de otra.  
[Addy Osmani](https://addyosmani.com/blog/factory-model/) lo resume muy bien: tu trabajo ya no es escribir código, es construir la fábrica que lo construye.

Tu responsabilidad pasa de revisar PRs a **diseñar los controles que hacen la revisión innecesaria**.

### 2. Ingeniero de especificaciones: define el qué, deja el cómo al agente

Cada vez más, el trabajo real del desarrollador es escribir buenas especificaciones: qué tiene que hacer esto, qué restricciones tiene, cómo sé que está bien hecho. El agente se encarga del cómo. La revisión deja de ser de código y pasa a ser de especificaciones.

Kent Beck habla de [deflación de la programación](https://tidyfirst.substack.com/p/programming-deflation) y lo explica de forma muy clara: programar se está abaratando, como cuando un producto baja de precio. Lo que no se abarata es todo lo demás. Entender el problema, saber descomponerlo, tener criterio para decidir qué construir y qué no.
Esas habilidades ahora valen más que nunca, precisamente porque el código ya **no** es lo escaso.

### 3. Habilitador de plataforma: consigue que otros no te necesiten

Este es el cambio más radical. Tu trabajo ya no es escribir el código del producto. Es conseguir que otros no te necesiten para escribirlo. Creas las herramientas, automatizaciones y guardarraíles para que POs, PMs, diseñadores y otros roles del negocio construyan directamente.

Andrew Ng ya lo está viviendo: [el ratio de 4 ingenieros por PM se está invirtiendo en algunos de sus equipos](https://x.com/lennysan/status/1943773031459172360). El cuello de botella se ha movido de implementar a definir. Ya no hablamos de **developer experience** para devs, hablamos de **developer experience** para todos los roles.

## El modelo de negocio también cambia, y tú con él

No solo hay cambio en rol, hay cambios en los modelos de negocio que nos obligan a adaptarnos.
El SaaS tradicional te da herramientas para que los humanos hagan su trabajo. El nuevo modelo, [Service as Software](https://foundationcapital.com/ai-service-as-software/), ofrece agentes que **hacen el trabajo directamente**.
Hasta ahora pagabas por un software de atención al cliente (Zendesk, Intercom) y ponías personas a usarlo. El nuevo modelo es un agente que directamente resuelve las consultas del cliente. No pagas por la herramienta, pagas por cada consulta resuelta. [Salesforce ya cobra así en Agentforce](https://www.salesforce.com/agentforce/pricing/).

Esto afecta al desarrollador: si lo que se vende es el resultado y no el software, tu trabajo no es entregar código bonito. Es asegurarte de que el sistema produce resultados fiables.

## El cambio ya está aquí

El desarrollador no desaparece, pero su trabajo cambia:

- De **escribir código** a **definir qué código merece existir**
- De **revisar PRs** a **diseñar sistemas que revisan por ti**
- De **implementar features** a **habilitar que otros las construyan**
- De **developer experience** para devs a **developer experience** para todos los roles

Ahora que el código es barato, lo escaso es el criterio.


Este artículo no existiría sin [Gork Martínez](https://www.linkedin.com/in/gorkma/) por compartir todo [lo que están aprendiendo](https://www.linkedin.com/posts/gorkma_hasta-ahora-ten%C3%ADa-claro-que-el-rol-del-desarrollador-activity-7437479812765728768-hw4h/) y [Emilio Carrión](https://www.linkedin.com/in/emcarrio/) por artículos como [este](https://www.emiliocarrion.com/en/blog/agente-ia-necesita-verificacion).