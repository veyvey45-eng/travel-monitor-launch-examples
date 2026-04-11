# MCP Registry and Directory Next Steps

**Author: Artur Rodrigues Adaga**  
**Prepared on: 2 April 2026**

## Why this file exists

This repository now includes a dedicated **`server.json`** manifest for the **Hotel Rate Monitoring API** MCP entry. The goal is to make the project easier to publish beyond the Apify Store and beyond plain README documentation.

The project already benefits from **Apify's hosted MCP server** at `https://mcp.apify.com`, which means a separate MCP server deployment is **not required** just to make this Actor usable from MCP-compatible clients. The next layer is **discoverability**: publishing or submitting this MCP entry to the most credible directories.

## What is already public

| Surface | Current status | What it gives us |
|---|---|---|
| **Apify Store page** | Public | Product page, README, input surface, endpoint surface, MCP-oriented explanation |
| **Apify MCP infrastructure** | Public | Hosted remote MCP server at `https://mcp.apify.com` |
| **GitHub examples repository** | Public | Quickstart docs, OpenAPI asset, examples, and now a dedicated `server.json` manifest |

## Best additional places to publish

The research completed for this project points to three serious surfaces.

| Surface | Priority | Why it matters | Does it require a new MCP server deployment? |
|---|---|---|---|
| **Official MCP Registry** | **Highest** | Canonical registry for MCP discoverability and likely upstream source for aggregators | **No**, if we publish a remote server manifest pointing to Apify |
| **Claude MCP Directory** | **High** | Strong distribution for Claude users and remote MCP adoption | **No**, but submission requirements are stricter |
| **Community directories** such as `mcp.so` | **Secondary** | Extra discoverability after the canonical publication is ready | **No**, but manual submission may still be required |

## Why there is no separate MCP deployment here

This project does **not** need a second standalone MCP server at this stage. The reason is simple: Apify already hosts a production MCP server that supports **Streamable HTTP** and **OAuth**. What this project needs is a **project-specific publication layer** that points to that hosted MCP server in a focused way.

That is exactly why this repository now includes `server.json`.

## What `server.json` is intended for

The included `server.json` is a registry-facing manifest that treats the project as a **remote MCP entry** backed by Apify's hosted MCP service.

| File | Purpose |
|---|---|
| **`server.json`** | Defines a publishable remote MCP entry for this project |
| **`docs/ai_agents_mcp_quickstart.md`** | Explains how agents should use the Actor |
| **`openapi/travel-monitor-launch.openapi.json`** | Complements MCP usage with direct API documentation |

## Remaining execution steps

The publication path is now clearer.

| Step | Action | Blocking factor |
|---|---|---|
| **1** | Commit and push `server.json` to GitHub | None |
| **2** | Validate or publish via the official MCP Registry tooling | Requires registry authentication |
| **3** | Prepare or submit the same remote MCP entry to the Claude directory | Requires compliance review and submission flow |
| **4** | Optionally submit to community directories | Manual follow-up may be needed |

## Practical conclusion

The MCP work should now be understood in two layers. The **runtime layer** is already handled by Apify through `https://mcp.apify.com`. The **discoverability layer** is what remains to be expanded through the official registry, Claude's directory, and selected community directories.

This means the next useful move is **not another infrastructure deployment**, but a **publication and submission workflow** built on top of the manifest already prepared in this repository.
