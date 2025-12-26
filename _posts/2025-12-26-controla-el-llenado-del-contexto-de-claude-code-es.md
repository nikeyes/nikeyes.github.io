---
layout: post
title: Cómo tener siempre visible el porcentaje de contexto en Claude Code
categories:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
tags:
  - GenAI
  - LLMs
  - Desarrollo guiado por IA
  - Claude Code
  - Context Engineering
lang: es
ref: como-tener-siempre-visible-el-porcentaje-de-contexto-en-claude-code
published: false
---

> "You can't manage what you can't measure" - Peter Drucker

## El problema

No sabes qué porcentaje de tu ventana de contexto has llenado hasta que ejecutas `/context`. Cuando lo haces, a veces ya es demasiado tarde y Claude empieza a ignorar tu `CLAUDE.md`.

## La solución

Una status bar que muestra el porcentaje de contexto usado en tiempo real:

```
✓ ████████████░░░░░░░░░░░░░░░░░░ [40% ctx] (Sonnet 4.5)
```

**Verde** (<40%), **amarillo** (40-60%), **rojo** (>60%). Con warning ⚠️ al llegar al 70%.

## Instalación

### 1. Instala jq (procesador JSON)

```bash
# macOS
brew install jq

# Linux (Ubuntu/Debian)
sudo apt-get install jq
```

### 2. Descarga el script

```bash
mkdir -p ~/.claude
curl -o ~/.claude/statusline.sh https://raw.githubusercontent.com/nikeyes/claude-code-config/main/statusline.sh
chmod +x ~/.claude/statusline.sh
```

### 3. Configura Claude Code

```bash
claude config edit
```

Añade esta configuración:

```json
{
  "statusLine": {
    "type": "command",
    "command": "~/.claude/statusline.sh",
    "padding": 0
  }
}
```

### 4. Reinicia Claude Code

Listo. Ahora ves tu porcentaje de contexto en todo momento.

## El resultado

Antes: "¿Estaré cerca del 60%? Ejecuto `/context` para ver"

Ahora: "Veo que estoy al 55%, termino esta tarea y hago `/clear`"

**Control proactivo del contexto.**

---

## Referencias

- [Script statusline.sh](https://github.com/nikeyes/claude-code-config/blob/main/statusline.sh)
- [Configuración completa](https://github.com/nikeyes/claude-code-config/blob/main/settings-personal.json)
- [Tu CLAUDE.md no funciona (sin Context Engineering)]({{ site.baseurl }}/2025/11/13/tu-claude-md-no-funciona-sin-context-engineering-es.html)
