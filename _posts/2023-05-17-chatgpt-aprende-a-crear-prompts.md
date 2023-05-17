---
layout: post
title: ChatGPT aprende a crear prompts
categories:
  - ChatGPT
  - prompts
tags:
  - ChatGPT
  - mejora continua
  - prompt engineering
published: false
---

> “Las IAs no te van a reemplazar pero la gente que sepa usar las IAs sí.” ― Jorge Castro 

## Dale un rol específico para la tarea que quieras resolver
- Si no enfocas a ChatGPT es más probable que falle:
![pera-mal.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/pera-mal.png)

- Ayuda ChatGPT a coger un rol específico y así pueda devolver información específica y especialista.
![pera-bien.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/pera-bien.png)

- Ejemplos para enfocar el prompt:
  - “Actúa como si fueras un experto en X”
  - "Quiero que actúes como X"
  - "Actúa con la personalidad de un X"

- Incluso puedes actuar como un conversor de unidades o que sea [Jesús de Nazaret](../prompts/chatgpt-jesus-nazaret.txtprompts/) y tener una conversación con él: 
![jesus-nazaret.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/jesus-nazaret.png)

## Cuidado con el contexto del chat
- CharGPT utiliza como contexto todo lo que hay antes de tu pregunta. 
- Si en el acertijo anterior, responde sandía, por mucho que cambies el prompt, seguirá diciendo sandiá.
- Es muy difícil sacarlo de ese contexto:
![olvida-contexto.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/olvida-contexto.png)

- La mejor forma de eliminar el contexto es empezar un nuevo chat.

## Utiliza verbos para indicar al acción que tiene que hacer
- Infinitos. Los típicos suelen ser:
	- Escribe
	- Resume (Usando bullet points de las ideas principales o elementos importantes)
	- Crea (un script, un programa, etc.)
	- Traduce (al castellano pirata)
	- Define
	- Explica
  - etc... 
	```
  Explícame el siguiente código en python:
	squared_numbers = [(lambda x:x**2)*num) for num in range(1,11)]
  ```

  - Ejemplo para crear tests:
	
  ```
  Actúa con la personalidad de un experto en desarrollo de software.
	Para el código anterior, lista los test cases y luego implementa los test cases
  ```

  ## Separa el contexto con carácteres especiales
  - Te ayudará a que el modelo funcione mejor
  - Evitarás <a href="https://learnprompting.org/docs/prompt_hacking/injection" target="_blank">Prompt Injection</a>
  - Ejemplo de prompt con buenas práctica:
	```
  Actúa como un periodista y resume el texto delimitado por las comillas triples en una sola frase. """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"""
  ```