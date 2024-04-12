---
layout: post
title: Pasos para implementar un caso de uso con IA Generativa
categories:
  - GenAI
  - LLMs
tags:
  - GenAI
  - LLMs
published: true
---

> ”Las IAs actuales son increíblemente inteligentes y asombrosamente tontas” - ¿?

Estos son los pasos que yo seguiría si quiero resolver un problema usando IA generativa:

1. Usa un producto de terceros que solucione tu problema.
2. Usa un proveedor de IA generativa via API. (OpenAI, AWS Bedrock, HuggingFace)
3. Usa [Prompt engineering avanzado](https://www.promptingguide.ai/es/techniques)
	- Crear tu propio catálogo de prompts y ejemplos para validar tus casos de uso.
4. Usa [RAG básico](https://www.promptingguide.ai/research/rag)
    - Recopila y estructura tu información 
5. Usa [RAG Avanzado](https://miro.com/app/board/uXjVNvklNmc=/)
	- Técnicas avanzadas de estructurar la información.
	- Técnicas avanzadas para la recuperación y generación
	- Usar mediación con el sistema RAG como [[Human in the loop]]
6. Usa un modelo sobre el que has hecho Fine-tuning usando una API
7. Usa un modelo sobre el que has hecho fine-tuning con técnicas avanzadas como [LoRa](https://arxiv.org/pdf/2106.09685v2.pdf), [PEFT - Parameter Efficient Fine-tuning](https://huggingface.co/blog/peft)

Si todo lo anterior no resuelve tu problema, crea tu propio modelo y sobretodo véndelo porque posiblemente haya gente que tenga el mismo problema que tú...
