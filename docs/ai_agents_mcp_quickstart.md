# AI Agents & MCP Quickstart

**Author: Artur Rodrigues Adaga**  
**Prepared on: 1 April 2026**

## Purpose

**Hotel Rate Monitoring API** is designed to be understandable by both humans and agents. The goal of this quickstart is to make the first agentic workflow explicit: connect an MCP-capable client to Apify, discover the Actor, launch it with the minimal input, verify the API with `/health`, and then retrieve the first structured pricing signal from `/travel/opportunities/feed`.

This matters because the hosted **Apify MCP server** allows AI clients to discover Actors, inspect Actor details, run them, and retrieve structured outputs directly through MCP tools [1]. Apify also documents a dedicated **ChatGPT integration** in which ChatGPT connects to the Apify MCP server through a custom connector authenticated with OAuth [2].

| What this guide helps an agent do | Why it matters |
|---|---|
| **Discover the Actor** | Avoid guessing the right Actor or input shape |
| **Launch the minimal first run** | Reduce unnecessary configuration friction |
| **Check `/health` first** | Verify service readiness before business calls |
| **Read `/travel/opportunities/feed` next** | Reach the first useful hotel pricing signal quickly |
| **Move to exports only after validation** | Keep the first interaction simple and operational |

## Recommended first agent workflow

The best first workflow is intentionally narrow. An AI agent should not start by exploring advanced delivery settings or downstream automation. It should first prove that the service is live and that the pricing feed is useful.

| Step | Recommended action | Expected outcome |
|---|---|---|
| **1** | Find or inspect `travelmonitorlab/travel-monitor-launch` through Apify tools | The agent understands the Actor purpose, input, and endpoint surface |
| **2** | Launch the Actor with the minimal input shown below | A standby-ready API instance is started in the standard mode |
| **3** | Call `/health` | The agent confirms that the service is alive |
| **4** | Call `/travel/opportunities/feed` | The agent retrieves the first structured hotel pricing signal |
| **5** | Optionally call CSV or Markdown export routes | The agent moves from validation to reporting only after the feed looks useful |

### Minimal input

```json
{
  "serviceMode": "api",
  "persistArtifacts": true
}
```

> Keep the advanced delivery section untouched for the first test. The initial goal is to validate one useful result, not to configure automation too early.

## Best endpoints for AI agents

A capable agent should follow a strict endpoint order. The first routes are operational checks, while the later routes provide business output and export surfaces.

| Endpoint | Best use for agents | Why this order works |
|---|---|---|
| `/health` | Fast liveness confirmation | Confirms the service is running before deeper calls |
| `/readiness` | Operational readiness check | Useful when the agent wants stronger preflight validation |
| `/travel/opportunities/feed` | First meaningful business result | Returns structured ranked pricing opportunities |
| `/travel/reports/top-opportunities` | Narrative JSON insight layer | Helps agents summarize findings for users |
| `/travel/opportunities/feed/export.csv` | Spreadsheet-ready export | Useful when the next step is analyst or BI handoff |
| `/travel/reports/top-opportunities/export.md` | Delivery-ready Markdown report | Useful for direct reporting and sharing |
| `/travel/delivery/bundle` | Advanced downstream packaging | Best used only after the business value is already validated |

## ChatGPT MCP quickstart

Apify documents a direct ChatGPT integration through the Apify MCP server. The documented flow is to enable **Developer mode**, create a custom connector, use **OAuth** authentication, and point the connector to **`https://mcp.apify.com`** [2]. Once the connector is authorized, ChatGPT can use Apify tools directly inside a conversation.

| Field in ChatGPT connector setup | Recommended value |
|---|---|
| **Name** | `apify-mcp` |
| **Description** | `Use Apify Actors and docs from ChatGPT` |
| **MCP Server URL** | `https://mcp.apify.com` |
| **Authentication** | `OAuth` |

After the connector is created, start a new chat, add the connector to the conversation, and ask ChatGPT to inspect or run the Actor. Apify notes that ChatGPT may request tool permission the first time each tool is used, and that connector creation requires Developer mode [2].

### Suggested ChatGPT prompt

> Use Apify tools to inspect `travelmonitorlab/travel-monitor-launch`, confirm the minimal input, start the Actor in `api` mode, verify `/health`, then summarize the first 10 results from `/travel/opportunities/feed` in plain English with the most actionable pricing gap first.

## Generic MCP client quickstart

Apify documents the hosted MCP endpoint as **`https://mcp.apify.com`** and also provides a local fallback using `npx -y @apify/actors-mcp-server` for clients that do not support remote hosted MCP servers [1]. The hosted MCP server additionally supports structured output schema inference for Actor results, which helps agents understand expected output fields before execution [1].

| Setup style | Configuration approach | When to use it |
|---|---|---|
| **Hosted MCP** | Use `https://mcp.apify.com` | Best for fast setup and OAuth-enabled clients |
| **Hosted MCP with restricted tools** | Use `https://mcp.apify.com?tools=actors,docs` | Best when you want a narrow tool surface |
| **Local stdio MCP** | Run `npx -y @apify/actors-mcp-server` with `APIFY_TOKEN` | Best when the client does not support hosted remote MCP |

### Hosted MCP configuration example

```json
{
  "mcpServers": {
    "apify": {
      "url": "https://mcp.apify.com"
    }
  }
}
```

### Local stdio configuration example

```json
{
  "mcpServers": {
    "actors-mcp-server": {
      "command": "npx",
      "args": ["-y", "@apify/actors-mcp-server"],
      "env": {
        "APIFY_TOKEN": "YOUR_APIFY_TOKEN"
      }
    }
  }
}
```

## Recommended tool scope for this Actor

Apify documents that the MCP tool surface can be narrowed by adding a `tools` query parameter to the hosted MCP URL [1]. For this Actor, the most useful setup is usually not a huge tool catalog, but a focused surface that lets the agent discover Actors, inspect details, and read documentation.

| Tool scope | Example | Why it is useful |
|---|---|---|
| **Standard discovery** | `https://mcp.apify.com` | Keeps the default Actor and documentation tools |
| **Focused discovery** | `https://mcp.apify.com?tools=actors,docs` | Good for assistants that only need Actor and docs access |
| **Extra browsing support** | `https://mcp.apify.com?tools=actors,docs,apify/rag-web-browser` | Useful when the agent also needs web research in the same workflow |

## Practical first-win logic for agents

The strongest agent behavior is to resist over-configuration. The agent should keep the input minimal, confirm service health, pull one structured opportunity feed, and only then decide whether CSV exports, Markdown reporting, or delivery bundles are worth using. This mirrors the same **first win** logic exposed on the Store page, which keeps the product understandable across human and agent entry points.

| Agent intent | Recommended route or action |
|---|---|
| **Is the API alive?** | `/health` |
| **Is it safe to rely on the service?** | `/readiness` |
| **What is the first useful hotel signal?** | `/travel/opportunities/feed` |
| **Can I summarize it for a user?** | `/travel/reports/top-opportunities` |
| **Can I hand it to an analyst?** | `/travel/opportunities/feed/export.csv` |
| **Can I generate a shareable report?** | `/travel/reports/top-opportunities/export.md` |

## References

[1]: https://docs.apify.com/platform/integrations/mcp "Apify MCP server | Platform | Apify Documentation"
[2]: https://docs.apify.com/platform/integrations/chatgpt "ChatGPT integration | Platform | Apify Documentation"
