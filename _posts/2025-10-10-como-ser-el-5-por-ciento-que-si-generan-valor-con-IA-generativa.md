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

Hace unos días os explicaba que [el 95% de los proyectos de IA generativa fracasan](https://nikeyes.github.io/solo-el-5-por-ciento-proyectos-ia-generan-valor-negocio-es/). Supongo que también os interesa saber **cómo ser ese 5% que triunfa**

La respuesta está en cómo definimos, construimos, operamos y medimos.

Pero antes la pregunta que casi nadie se hace.

## ¿Estás seguro de que la IA es la respuesta?

Muchos proyectos fracasan porque intentan resolver con IA problemas que no la necesitan.

**Usa IA cuando las reglas no escalan:**
Análisis de documentos desestructurados, contenido personalizado, asistencia donde cada caso es diferente. Cuando escribir todas las reglas es imposible, la IA tiene sentido.

**Usa IA cuando los números cuadran:** 
Si automatizar vale más que lo que ahorras, no hay negocio. Simple.
El coste de construir, escalar y mantener el sistema con IA tiene que ser menor que el coste humano.

**No uses IA si lo puedes resolver de forma clásica:**
Cálculos, validaciones, reglas claras. Un if/else es más barato, más rápido y más fiable que un modelo.

**No uses la IA si el riesgo es inaceptable:**
Decisiones críticas sin revisión humana, sectores regulados, fallos con consecuencias graves. Pregúntate que pasa si el sistema no se comporta como esperamos ¿Cómo de grave es?


## 5 obstáculos a superar

### 1. Valor primero, tecnología después

**El problema:** Creamos demos impresionantes sin impacto de negocio. Prototipos técnicos sin usuarios ni métricas. Pilotos que nunca escalan.

**Pregunta clave:** ¿Estoy construyendo esto porque mola, o porque resuelve un problema medible para alguien concreto?

**Caso real:** Lumen redujo la preparación de reuniones de venta de 4 horas a 15 minutos usando Copilot para investigación y análisis. Resultado: $50M de ahorro anual proyectado. Métrica clara desde el día 1: tiempo ahorrado por vendedor.

**Qué hacer:**
- Define métricas de negocio antes de escribir código: tiempo ahorrado, errores evitados, ingresos generados.
- Empieza con MVPs medibles. Un flujo, un proceso, una métrica.
- Si tras N semanas no hay impacto medible, cancela o pivota.

### 2. Convierte incertidumbre en confianza

**El problema:** Las respuestas pueden ser incorrectas, inexactas o inventadas. Los problemas los descubres tarde o los descubren tus usuarios. No hay trazabilidad ni gobernanza.

**Caso real:** CirrusMD automatizó notas SOAP y navegación de beneficios para 13M+ miembros manteniendo compliance total. Clave: sistema genera notas completas pero siempre requiere revisión médica antes de aprobar. Human-in-the-loop en decisiones críticas.

**Qué hacer:**
- Haz visible el razonamiento del modelo. Un botón "¿Por qué me recomiendas esto?" vale más que nuevas funcionalidades con IA.
- Observabilidad desde el día 1. Logs estructurados, métricas en tiempo real, alertas automáticas.
- Testing continuo de calidad. ¿Las respuestas son consistentes? ¿Siguen correctas tras actualizar el prompt?
- Human-in-the-loop para decisiones críticas. Define puntos donde alguien pueda intervenir, corregir o anular.
- Runbooks para incidentes. Cuando falle (y fallará), ¿qué haces?

### 3. Arquitectura sencilla que evoluciona con el negocio

**El problema:** Abstracciones prematuras que colapsan al cambiar de versión o de proveedor. Usar las últimas librerías que viste en el video de Youtube pero que tienen breaking changes en cada versión.

**Caso real:** Accenture desplegó GitHub Copilot con RCT a miles de desarrolladores. 96% empezaron a usarlo el día 1, hasta 55% más rápidos. Éxito: integración transparente en flujos existentes sin cambiar arquitectura del equipo.

**Regla de oro:** Si cambiar de Claude Sonnet a Gemini te lleva más de 1 día, tu arquitectura es frágil.

**Qué hacer:**
- Separa tu lógica de negocio de los proveedores de modelos y librerías de LLMs.
- Implementa fallbacks. Si el modelo no funciona, salta a un flujo manual.
- Capas de adaptación sencillas. Los modelos cambian, tu arquitectura no debería.

### 4. Sostenibilidad económica

**El problema:** Reintentos infinitos, ventanas de contexto mal gestionadas, facturas que crecen exponencialmente. Si no hay margen, no hay negocio.

**Caso real:** Klarna gestionó 2.3M de conversaciones equivalente a 700 agentes. Proyección: $40M en mejora de beneficios para 2024. Vodafone redujo coste por chat de $3 a $0.90 (70%) usando RAG. Clave: monitorizar coste por operación vs valor generado desde el día 1.

**Qué hacer:**
- Establece presupuestos de tokens por caso de uso. No dejes consumo ilimitado.
- Implementa caché agresivas. La misma pregunta no debe llegar a la API dos veces.
- Monitoriza en tiempo real. Un pico de costes es síntoma de algo roto.
- Si no es rentable, no podrás escalar.

### 5. Precisión cuando importa

**El problema:** En sectores regulados o de alto riesgo, "casi correcto" no es suficiente. Un error puede tener consecuencias graves.

**Caso real:** JPMorgan Chase (COIN) revisó contratos legales reduciendo de 360,000 horas anuales a segundos. LawGeex logró 94% de precisión vs 85% humana en NDAs. Éxito: IA especializada en un dominio muy específico con validación continua.

**Qué hacer:**
- Especializa modelos en tu dominio. Fine-tuning, RAG o modelos específicos superan a LLMs genéricos en tareas de nicho.
- Valida continuamente. Define umbrales mínimos de precisión y monitoriza degradación.
- Implementa revisión humana escalonada según nivel de riesgo de la decisión.

## Lo que funciona en el mundo real

**Empieza pequeño, pero completo**
No hagas 10 demos. Haz 1 flujo end-to-end en producción con telemetría e impacto medible.

**Especializa, no generalices**
Tu ventaja está en el conocimiento de tu dominio. Usa Fine-tuning, RAG o modelos específicos cuando resuelves problemas de nicho.
Los LLMs funcionan bien para resolver problema genéricos.

**Integra en flujos existentes**
Si la IA añade fricción, nadie la usará. La mejor IA es invisible para el usuario.

**Itera con usuarios reales**
Tu equipo dirá que funciona. Los usuarios reales te enseñarán dónde falla y si estás resolviendo un problema real.

## Esto es lo que realmente importa

La diferencia no está en los modelos que usas.
Está en las preguntas que te haces antes de escribir código.

No construyen tecnología para demos. Resuelven problemas usando tecnología.

Y sobre todo: saben que el éxito no está en cuánto código generan, sino en cuánto valor entregan.
La pregunta sigue siendo la misma:

**¿Estás construyendo lo correcto?**

---

**Referencias:**
- [MIT Nanda - The GenAI Divide - State of AI in business 2025](https://mlq.ai/media/quarterly_decks/v0.1_State_of_AI_in_Business_2025_Report.pdf)
- [McKinsey - One year of agentic AI: Six lessons from the people doing the work](https://www.mckinsey.com/~/media/mckinsey/business%20functions/quantumblack/our%20insights/one%20year%20of%20agentic%20ai%20six%20lessons%20from%20the%20people%20doing%20the%20work/one-year-of-agentic-ai-six-lessons-from-the-people-doing-the-work_final.pdf)
- [MIT Says 95% of AI Pilots Fail. McKinsey Explains Why. Agentic Engineering Shows How to Fix It.](https://medium.com/generative-ai-revolution-ai-native-transformation/mit-says-95-of-ai-pilots-fail-mckinsey-explains-why-agentic-engineering-shows-how-to-fix-it-66a7bb2d8e0d)
- [Caso Lumen](https://www.microsoft.com/en-us/worklab/agents-of-change)
- [Caso CirrusMD](https://writer.com/blog/roi-for-generative-ai/)
- [Caso Accenture](https://github.blog/news-insights/research/research-quantifying-github-copilots-impact-in-the-enterprise-with-accenture/)
- [Caso Klarna y Vodafone](https://www.nexgencloud.com/blog/case-studies/how-ai-and-rag-chatbots-cut-customer-service-costs-by-millions)
- [Caso JPMorgan](https://www.abajournal.com/news/article/jpmorgan_chase_uses_tech_to_save_360000_hours_of_annual_work_by_lawyers_and#google_vignette)
- [Caso LawGeex](https://www.virtasant.com/ai-today/ai-contract-mangement-legal)