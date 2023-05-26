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
published: true
---

> “Las IAs no te van a reemplazar, pero la gente que sepa usar las IAs mejor que tú, sí.” ― Jorge Castro 

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
	
  ```python
  Explícame el siguiente código en python:
	squared_numbers = [(lambda x:x**2)*num for num in range(1,11)]
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

## Cuidado con los símbolos y faltas de ortografía porque pueden cambiar el comportamiento
- Poner solo un simbolo de interrogación en una pregunta en castellano o tener faltas de ortografía pueden hacer que la respuesta no sea la correcta y genere más alucionaciones de lo normal.


## Indica como quieres el formato de la respuesta
  - Dame solo la respuesta corta y la información adicional en un apartado separado llamado: "Información adicional"
  - Presenta la información en una Tabla, Lista, JSON, HTML.....
  - Añade emojis
  - Añade encabezados y subtítulos para que la estructura sea más legible. Por ejemplo: Quiero saber las ventajas y desventajas de un Open Space. Añade subtítulos para las ventajas y desventajas.
  - Includo puedes pedirle que te devuelva diagramas <a href="https://mermaid.js.org/" target="_blank">Mermaid.js</a>  

  ![output-mermaid.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/output-mermaid.png)  

  ![output-mermaid-playground.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/output-mermaid-playground.png)  

# Puedes usar el negativo en los prompts para ser más detallado
- No escribas sobre X
- Solo explícame X
- Por ejemplo:

```
Actúa como un experto crítico de cine. Hazme un resumen de las 10 mejores películas estrenadas en 2019, pero no escribas sobre ninguna película de terror ni romance
```

![pelis-2019-critico.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/pelis-2019-critico.png)  



```
Actúa como un adolescente. Hazme un resumen de las 10 mejores películas estrenadas en 2019, pero no escribas sobre ninguna película de terror ni romance
``` 

![pelis-2019-adolescente.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/pelis-2019-adolescente.png)  


## Funciona mejor si le dejas pensar
Cuando quieras que razone o te explique algo usa prompts como:
- Piensa paso a paso
- En primer lugar, piensa paso a paso por qué X podría ser verdadero y luego explicame la respuesta de forma razonada.
- Dame instrucciones paso a paso para XYZ
- En primer lugar, elabora tu propia solución al problema y luego...

## Indica el canal de comunicación
- Si indicas el canal de comunicación el resultado es muy diferente.
- Si le dices que es para un blog, para Twitter, para LinkedIn o un guión de YouTube lo hará expecífico para ese canal.

## Ten en cuenta el estilo y el tono
Por ejemplo:
- Usa un estilo de escritura informativo y periodístico
- Usa un estilo de escritura y crítico y polémico

## Ten en cuenta la Audiencia
No es lo mismo escribir un texto dirigido a un grupo de niños de prescolar que un texto para el grupo de decanos de tu universidad.

Por ejemplo: 

```
Escribe una poesía corta. El público objetivo son desarrolladores con menos de 1 año de experiencia.
```

![crear-poesía-desarrolladores-junior.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/crear-poesía-desarrolladores-junior.png)  

```
Escribe una poesía corta. El público objetivo son desarrolladores con más de 20 años de experiencia.
```

![crear-poesía-desarrolladores-senior.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/crear-poesía-desarrolladores-senior.png)

## Usa la creatividad de ChatGPT
Usa esta frase como parte de tu prompt para buscar nuevos enfoques:

```
Genera ángulos o estrategias únicas y enfatiza las ideas innovadoras para el tema
``` 

## Incluso puedes usar un Prompt creador de prompts

Aquí tienes un link a un <a href="https://www.ordinarypeopleprompts.com/item-detail?recordId=recVbgybDLlYmsvuA" target="_blank">prompt creador de prompts</a> 
