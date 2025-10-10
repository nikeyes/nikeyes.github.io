---
layout: post
title: Cómo ser del 5% que sí genera valor con IA generativa
categories:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
tags:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
lang: es
ref: 
published: false
---

> "Las ideas son fáciles. La ejecución lo es todo." - John Doerr

Hace unos días os explicaba que [el 95% de los proyectos de IA generativa fracasan](https://nikeyes.github.io/solo-el-5-por-ciento-proyectos-ia-generan-valor-negocio-es/). Supongo que también os interesa saber **cómo ser ese 5% que triunfan**

La respuesta está en cómo definimos, construimos, operamos y medimos.

## Los 6 obstáculos y cómo superarlos

### 1. Valor primero, tecnología después

**El problema:** Creamos demos impresionantes sin impacto de negocio. Prototipos sin ROI. Pilotos que nunca escalan. Pilotos técnicos sin usuarios ni métricas.

**Pregunta clave:** ¿Estoy construyendo esto porque puedo, o porque realmente resuelve un problema medible para alguien concreto?

**Qué hacer:**
- Define métricas de negocio antes de escribir código: tiempo ahorrado, errores evitados, ingresos generados.
- Empieza con MVPs medibles. Un flujo, un proceso, una métrica.
- Si tras N semanas no hay impacto medible, cancela o pivota.

### 2. Construye confianza como producto

**El problema:** Los modelos repondes pero el resultado puede ser incorrecto, inexacto o inventado. No tinenes trazabilidad ni gobernanza efectiva.

**Ejemplo práctico:** Un botón de "¿Por qué me recomiendas esto?" vale más que 10 features más.

**Qué hacer:**
- Haz visible el razonamiento del modelo y las decisiones.
- No todo debe ser automático. Implementa human-in-the-loop para decisiones críticas. 
- Desde el día 1: logging completo, audit trails, control de acceso.
- Define qué datos puede ver la IA y cuáles están prohibidos.

### 3. Arquitectura sencilla que evoluciona con el negocio

**El problema:** Abstracciones prematuras que colapsan al cambiar de versión o de proveedor. Usar librerías con breaking changes en cada versión.

**Regla de oro:** Si cambiar de Claude Sonnet a Google Gemini te lleva más de 1 día, tu arquitectura es muy frágil.

**Qué hacer:**
- Separa tu lógica de negocio de los proveedores de modelos o librerías para trabajar con LLMs.
- Implementa fallbacks. Si el modelo o el proveedor que usas no funciona, ¿Tienes un plan B?
- Usa capas de adaptación sencillas. Los modelos cambian pero tu arquitectura no debería.

### 4. Excelencia operativa: no vueles a ciegas

**El problema:** Los fallos son silenciosos. Los problemas los descubren se descubren muy tarde o los descubren los clientes.

**Desde el día 1:** Logs estructurados, métricas en tiempo real, alertas automáticas.

**Qué hacer:**
- Observabilidad desde el primer día. Si no puedes verlo, no puedes arreglarlo.
- Testing continuo de calidad. ¿Las respuestas son consistentes? ¿Siguen siendo correctas después de actualizar el prompt?
- Runbooks para incidentes. Cuando falle (y fallará), ¿qué haces?
- Convierte fallos silenciosos en incidentes recuperables.

### 5. Supervisión humana no negociable

**El problema:** Sistemas completamente autónomos en los que nadie puede intervenir ni entender las decisiones.

**Implementación:** Sistemas de supervisión, posibilidad de override, feedback loop para mejorar.

**Qué hacer:**
- Define puntos de intervención humana. Alguien debe poder parar, corregir o anular las decisiones del modelo.
- Define métricas de confianza: tasa de alucinaciones, consistencia, feedback de usuarios.
- Crea procesos de revisión antes de cada cambio en producción.

### 6. Sostenibilidad económica

**El problema:** Reintentos infinitos, ventanas de contexto mal gestionadas, facturas que crecen exponencialmente.

**Cálculo básico:** Coste por operación vs. valor generado. Si no hay margen, no hay negocio.

**Qué hacer:**
- Establece budgets de tokens por caso de uso. No dejes consumo ilimitado.
- Implementa caché agresivas. La misma pregunta no debe golpear la API dos veces.
- Monitorea en tiempo real. Un pico de costes es síntoma de algo roto.
- Si no es rentable, no podrás escalar.

## Lo que funciona en la práctica

Estos son los patrones recurrentes de los proyectos exitosos:

**Empieza pequeño, pero completo**  
No hagas 10 demos. Haz 1 flujo end-to-end en producción con telemetría completa e impacto en usuarios.

**Especializa, no generalices**  
Los LLMs genéricos fallan en problemas de nicho. Si no estás resolviendo un problema genérico, usa Fine-tuning, RAG, o modelos pequeños específicos. Tu ventaja está en el conocimiento específico de tu dominio.

**Integra en flujos existentes**  
Si añade fricción, nadie lo usará. Si añade fricción, nadie lo usará. La mejor IA es la que el usuario no percibe mientras usa tu producto.

**Mide desde el primer día**  
Lanza a un grupo reducido de usuarios reales. Mide impacto, recopila feedback, valida antes de escalar.

**Itera con usuarios reales**  
Tu equipo dirá que funciona. Los usuarios reales te mostrarán dónde falla y siestás resolviendo un problema real.

## Lo que realmente importa

El 5% que triunfa no tiene los mejores modelos. Elige bien qué construir y cómo medirlo.

No construyen tecnología buscando problemas. Resuelven problemas usando tecnología.

Y sobre todo: saben que el éxito no está en cuánto código generan, sino en cuánto valor entregan.

La pregunta sigue siendo la misma:

**¿Estás construyendo lo correcto?**

---

**Referencias:**
- [MIT Nanda - The GenAI Divide - State of AI in business 2025](https://mlq.ai/media/quarterly_decks/v0.1_State_of_AI_in_Business_2025_Report.pdf)
- [McKinsey - One year of agentic AI: Six lessons from the people doing the work](https://www.mckinsey.com/~/media/mckinsey/business%20functions/quantumblack/our%20insights/one%20year%20of%20agentic%20ai%20six%20lessons%20from%20the%20people%20doing%20the%20work/one-year-of-agentic-ai-six-lessons-from-the-people-doing-the-work_final.pdf)
- [MIT Says 95% of AI Pilots Fail. McKinsey Explains Why. Agentic Engineering Shows How to Fix It.](https://medium.com/generative-ai-revolution-ai-native-transformation/mit-says-95-of-ai-pilots-fail-mckinsey-explains-why-agentic-engineering-shows-how-to-fix-it-66a7bb2d8e0d)

