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

> “Las IAs no te van a quitar el trabajo, pero las personas que sepan usar las IAs mejor que tú, sí.” ― Jorge Castro 

## 1. Dale un rol específico para la tarea que quieras resolver
- Si no enfocas a ChatGPT es más probable que falle:
![pera-mal.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/pera-mal.png)

- Ayuda ChatGPT a que coja un rol específico y que te devuelva información más específica y especializada.
![pera-bien.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/pera-bien.png)

- Ejemplos para enfocar el prompt:
  - “Actúa como si fueras un experto en X”
  - "Quiero que actúes como X"
  - "Actúa con la personalidad de un X"

- Incluso puedes actuar como un conversor de unidades o que sea [Jesús de Nazaret](../prompts/chatgpt-jesus-nazaret.txtprompts/) y tener una conversación con él: 
![jesus-nazaret.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/jesus-nazaret.png)

## 2. Cuidado con el contexto del chat
  - ChatGPT utiliza como contexto todo lo que hay antes de tu pregunta. 
  - Si en el acertijo anterior responde sandía, por mucho que cambies el prompt, seguirá diciendo sandía.
  - Es muy difícil sacarlo de ese contexto:

  ![olvida-contexto.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/olvida-contexto.png)

  - La mejor forma de eliminar el contexto es empezar un nuevo chat.

## 3. Utiliza verbos para indicar la acción que tiene que hacer
  - Hay infinitos, pero los típicos suelen ser:
	  - Escribe
	  - Resume (Usando bullet points de las ideas principales o elementos importantes)
	  - Crea (un script, un programa, etc.)
	  - Traduce (al castellano pirata)
	  - Define
	  - Explica
    - etc... 
	
 
> Explícame el siguiente código en python:  
> squared_numbers = [(lambda x:x**2)*num for num in range(1,11)]
  

  - Ejemplo para crear tests:
	
> Actúa con la personalidad de un experto en desarrollo de software.  
> Para el código anterior, lista los test cases y luego implementa los test cases


## 4. Separa el contexto con carácteres especiales
  - Te ayudará a que el modelo funcione mejor.
  - Evitarás <a href="https://learnprompting.org/docs/prompt_hacking/injection" target="_blank">Prompt Injection</a>
  - Ejemplo de prompt con buenas práctica:
	 
> Actúa como un periodista y resume el texto delimitado por las comillas triples en una sola frase. """Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s"""
   

## 5. Cuidado con los símbolos y faltas de ortografía porque pueden cambiar el comportamiento
- Poner solo un símbolo de interrogación en una pregunta en castellano o tener faltas de ortografía pueden hacer que la respuesta no sea la correcta y genere más alucinaciones de lo normal.


## 6. Indica cómo quieres el formato de la respuesta
  - Dame solo la respuesta corta y la información adicional en un apartado separado llamado: "Información adicional"
  - Presenta la información en una Tabla, Lista, JSON, HTML.....
  - Añade emojis
  - Añade encabezados y subtítulos para que la estructura sea más legible. Por ejemplo: Quiero saber las ventajas y desventajas de un Open Space. Añade subtítulos para las ventajas y desventajas.
  - Incluso puedes pedirle que te devuelva diagramas <a href="https://mermaid.js.org/" target="_blank">Mermaid.js</a>  

  ![output-mermaid.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/output-mermaid.png)  

  ![output-mermaid-playground.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/output-mermaid-playground.png)  


# 7. Puedes usar el negativo en los prompts para ser más detallado
- No escribas sobre X
- Solo explícame X
- Por ejemplo:

> Actúa como un experto crítico de cine. Hazme un resumen de las 5 mejores películas estrenadas en 2019, pero no escribas sobre ninguna película de terror ni romance

![pelis-2019-critico.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/pelis-2019-critico.png)  

> Actúa como un adolescente. Hazme un resumen de las 10 mejores películas estrenadas en 2019, pero no escribas sobre ninguna película de terror ni romance
 
![pelis-2019-adolescente.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/pelis-2019-adolescente.png)  


##  8. Funciona mejor si le dejas pensar
Cuando quieras que razone o te explique algo usa prompts como:
- Piensa paso a paso
- En primer lugar, piensa paso a paso por qué X podría ser verdadero y luego explícame la respuesta de forma razonada.
- Dame instrucciones paso a paso para XYZ
- En primer lugar, elabora tu propia solución al problema y luego...


## 9. Indica el canal de comunicación
- Si indicas el canal de comunicación el resultado es muy diferente.
- Si le dices que es para un blog, para Twitter, para LinkedIn o un guión de YouTube lo hará específico para ese canal.


## 10. Ten en cuenta el estilo y el tono
Por ejemplo:
- Usa un estilo de escritura informativo y periodístico
- Usa un estilo de escritura crítico y polémico


## 11. Ten en cuenta la audiencia
No es lo mismo escribir un texto dirigido a un grupo de niños de preescolar que un texto para el grupo de decanos de tu universidad.

Por ejemplo: 

> Escribe una poesía corta. El público objetivo son desarrolladores con menos de 1 año de experiencia.

![crear-poesía-desarrolladores-junior.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/crear-poesía-desarrolladores-junior.png)  

> Escribe una poesía corta. El público objetivo son desarrolladores con más de 20 años de experiencia.

![crear-poesía-desarrolladores-senior.png]({{ site.baseurl }}/images/2023-05-17-chatgpt-aprende-a-crear-prompts/crear-poesía-desarrolladores-senior.png)


## 12. Usa la creatividad de ChatGPT
Usa esta frase como parte de tu prompt para buscar nuevos enfoques:

> Genera ángulos o estrategias únicas y enfatiza las ideas innovadoras para el tema


## 13. Incluso puedes usar un prompt creador de prompts

Aquí tienes un link a un <a href="https://www.ordinarypeopleprompts.com/item-detail?recordId=recVbgybDLlYmsvuA" target="_blank">prompt creador de prompts</a> 




Si encuentras nuevas ideas para crear tus prompts puedes contármelas en <a href="https://twitter.com/nikey_es" target="_blank">twitter</a>