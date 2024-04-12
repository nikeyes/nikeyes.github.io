---
layout: post
title: Qué tener en cuenta para elegir un model de GenAI
categories:
  - GenAI
  - LLMs
tags:
  - GenAI
  - LLMs
published: true
---

> ”El secreto de ir hacia delante es empezar” - Mark Twain

## Idioma:
  - Soporte oficial y no oficial
  - La mayoría de los modelos admiten varios idiomas
  - Mira la información en las tarjetas de modelos
  - Soporte para lenguajes de programación, scripts y archivos de configuración

## Tamaño del Contexto:
  - Varía de 4K a 100K
  - Los tamaños de contexto de entrada suelen ser más grandes que los tamaños de contexto de salida
  - Tamaños de contexto grandes pueden simplificar el procesamiento de documentos (100K \~300 páginas de texto)
  - Tamaños de contexto de entrada grandes permiten la ingeniería de consultas complejas
  - No es una métrica de rendimiento ni de precisión

## Opciones de Personalización:
  - Comienza con prompt engineering
  - Opciones de ajuste fino (PEFT, LoRA, Ajuste fino completo)
  - Puedes hacer ajustr fino varias veces
  - Normalmente requiere un conjunto de entrenamiento de 1000 registros
  - Soporte a técnicas creadas por la comunidad para modelos de código abierto

## Rendimiento:
  - Rendimiento del modelo (token/s)
  - Latencia (ms/token)
  - Precisión del modelo
  - Precio vs Rendimiento:
    - Más lento pero más barato
    - Caro pero preciso

## Tipo de Entrenamiento:
  - Pre-entrenado ("Raw")
  - Ajustado a instrucciones ("Instruct")
  - Ajustado a diálogo ("Chat")
  - Preferencias humanas (RLHF, DPO)

## Tamaño:
  - Número de parámetros del modelo
  - Indicador aproximado de las capacidades del modelo
  - No es un indicador de rendimiento
  - Los proveedores pueden indicar el tamaño relativo ("Mediano", "Grande", etc.)

## Arquitectura:
  - Detalles del pre-entrenamiento
  - Componentes principales (Embeddings, transformers, layers)
  - Estrategia de alineación
  - Orientado a investigadores