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
published: true
---

> "You can't manage what you can't measure" - Peter Drucker

Claude Code permite personalizar una "status line" para que se actualice después de cada comando. [Status line configuration](https://code.claude.com/docs/en/statusline)

Yo estoy continuamente ejecutando el comando `/context`. Si no sabes por qué tienes que vigilar tu contexto te recomiendo mi artículo [Tu CLAUDE.md no funciona (sin Context Engineering)]({{ site.baseurl }}/2025/11/13/tu-claude-md-no-funciona-sin-context-engineering-es.html)

El comando `/context` es lento y rompe mi flujo de trabajo, así que he creado una status line para ver el estado del contexto en tiempo real.

**Verde** (<40%)

<img src="{{ site.baseurl }}/images/2025-12-26-controla-el-llenado-del-contexto-de-claude-code-es/context-status-line-green.png" alt="Status bar verde - contexto bajo 40%" style="max-height:400px; width:auto; height:auto;"/>  

**Amarillo** (40-60%)

<img src="{{ site.baseurl }}/images/2025-12-26-controla-el-llenado-del-contexto-de-claude-code-es/context-status-line-yellow.png" alt="Status bar amarillo - contexto entre 40% y 60%" style="max-height:400px; width:auto; height:auto;"/>  

**Rojo** (>60%). Con warning ⚠️ al llegar al 70% porque te acercas al auto-compactado, si lo tienes activado.

<img src="{{ site.baseurl }}/images/2025-12-26-controla-el-llenado-del-contexto-de-claude-code-es/context-status-line-red.png" alt="Status bar rojo - contexto sobre 60% con warning" style="max-height:400px; width:auto; height:auto;"/>  

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

Añade esta configuración en el archivo `~/.claude/settings.json`

```json
{
  "statusLine": {
    "type": "command",
    "command": "~/.claude/statusline.sh",
    "padding": 0
  }
}
```

Ejemplo: [https://github.com/nikeyes/claude-code-config/blob/main/settings-personal.json#L14](https://github.com/nikeyes/claude-code-config/blob/main/settings-personal.json#L14)

### 4. Reinicia Claude Code

Listo. Ahora ves tu porcentaje de contexto en todo momento.

<img src="{{ site.baseurl }}/images/2025-12-26-controla-el-llenado-del-contexto-de-claude-code-es/context-status-line-complete.png" alt="Claude Code with context status line" style="max-height:400px; width:auto; height:auto;"/>  

## Nota sobre auto-compactado

**Yo tengo desactivado el auto-compactado de contexto.** Si lo tienes activado, Claude Code se reserva un 22,5% del contexto para poder hacer el compactado. Así que cuando llegues al **77% del contexto, se compactará automáticamente**.

Yo uso el plugin [stepwise-dev](https://github.com/nikeyes/stepwise-dev) y no compacto nunca. Controlo el contexto en cada paso y limpio el contexto entero en cada fase: Research → Plan → Implement Phase X → Validate.

