---
layout: post
title: Guardrails para LLMs
categories:
  - GenAI
  - LLMs
tags:
  - GenAI
  - LLMs
published: true
---

> ”La potencia sin control no sirve de nada”  - Pirelli

| Herramienta                                                                               | Tipo de guardrail                 | Descripción                                                                                                                                                                                                                                           |
| ----------------------------------------------------------------------------------------- | --------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Amazon Bedrock Guardrails](https://aws.amazon.com/bedrock/guardrails/)                   | Evalua entradas y salidas         | Servicio administrado de AWS que permite configurar políticas de seguridad personalizables. Controlando contenido inapropiado, alucinaciones y protege información sensible.                                                                             |
| [LLM Guard by Protect AI](https://llm-guard.com)                                          | Evalua entradas y salidas         | Saneamiento de la entrada, detección de lenguaje dañino, prevención de fuga de datos y resistencia contra ataques de inyección de prompts.                                                                                                                |
| [protectai/rebuff](https://github.com/protectai/rebuff)                                   | Evalua entradas y crea señuelos   | Detector de inyección de prompts - Heurísticas, detección basada en LLMs, VectorDB para ataques previos, CanaryTokens.                                                                                                                                    |
| [deadbits/vigil](https://github.com/deadbits/vigil-llm)                                   | Evalua entradas y crea señuelos   | Detector de inyección de prompts - [Heurísticas/YARA](https://virustotal.github.io/yara/),  detección basada en LLMs, VectorDB scanner, Tokens señuelo, Similitud de respuesta de prompts.                                                                |
| [NVIDIA/NeMo-Guardrails](https://github.com/NVIDIA/NeMo-Guardrails)                       | Evalua salidas                    | Kit de herramientas de código abierto para añadir fácilmente barreras de seguridad programables a aplicaciones conversacionales basadas en LLM.                                                                                                           |
| [amoffat/HeimdaLLM](https://github.com/amoffat/HeimdaLLM)                                 | Evalua salidas                    | Framework de análisis estático para validar que la salida estructurada generada por un LLM sea segura. Actualmente solo soporta SQL.                                                                                                                      |
| [guardrails-ai/guardrails](https://github.com/guardrails-ai/guardrails)                   | Evalua entradas y salidas         | Barreras de entrada/salida que detectan, cuantifican y mitigan la presencia de varios [tipos de riesgos](https://hub.guardrailsai.com/).                                                                                                                  |
| [whylabs/langkit](https://github.com/whylabs/langkit)                                     | Evalua entradas y salidas         | Kit de herramientas de código abierto para monitorizar LLMs. Actualmente soporta estas [métricas](https://github.com/whylabs/langkit?tab=readme-ov-file#features-%EF%B8%8F)                                                                               |
| [Llama Guard 3](https://www.llama.com/docs/model-cards-and-prompt-formats/llama-guard-3/) | Evalua entradas y salidas         | Modelo especializado de Meta diseñado para clasificar contenido potencialmente dañino en 13 categorías. Por ejemplo: S1-Crímenes violentos, S11-Autolesiones o S13-Elecciones. Actua como filtro tanto para prompts como para respuestas en sistemas LLM. |
| [Prompt Guard](https://www.llama.com/docs/model-cards-and-prompt-formats/prompt-guard/)   | Evalua entradas                   | Modelo de clasificación desarrollado por Meta para detectar intentos específicos de inyección de prompts y técnicas de jailbreak.                                                                                                                         |
| [CodeShield](https://github.com/meta-llama/PurpleLlama/tree/main/CodeShield)              | Validación de seguridad en código | Herramienta de PurpleLlama (Meta) especializada en escanear código generado por LLMs para identificar potenciales vulnerabilidades de seguridad y malas prácticas de desarrollo.                                                                          |

