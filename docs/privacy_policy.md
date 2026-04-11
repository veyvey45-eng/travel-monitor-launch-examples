# Privacy Policy

This privacy policy applies to the public examples repository and documentation for **Hotel Rate Monitoring API** and to the referenced remote MCP access pattern exposed through Apify.

## Scope

This repository primarily distributes documentation, sample payloads, example scripts, and a public MCP manifest. By itself, the repository does not require account creation, does not directly collect end-user personal data, and does not run background tracking logic under its own infrastructure.

The actual API and MCP interactions referenced by this repository are executed through third-party infrastructure, primarily **Apify**. When a user connects an MCP client or calls the API endpoints described here, request handling, authentication flows, logs, and operational telemetry may be processed by the hosting platform used for that service.

| Area | How data is handled |
|---|---|
| **Repository browsing** | Standard GitHub page access may generate platform logs controlled by GitHub |
| **API calls** | Requests are processed by the remote service endpoint hosted via Apify |
| **Authentication** | Users should authenticate with their own credentials or tokens and should not share secrets publicly |
| **Example files** | The repository only publishes demonstration payloads and documentation assets intended for public viewing |

## Data minimization

Users should only submit the minimum data necessary to evaluate the service. API tokens, private keys, and confidential hotel business data should be handled in the user’s own secure environment and must not be committed to public repositories.

## Third-party services

This project references or depends on third-party services that may process data according to their own policies. These services can include:

| Service | Role |
|---|---|
| **GitHub** | Hosts the public examples repository and issue tracker |
| **Apify** | Hosts the remote API and MCP entry points referenced by this repository |
| **Anthropic / MCP clients** | May process prompts, tool calls, and authentication flows depending on the client used by the end user |

Users should review the privacy and security documentation of each third-party platform they choose to use.

## Security expectations

Users are responsible for protecting their own credentials, configuring least-privilege access, and avoiding the disclosure of tokens in screenshots, shared logs, issue reports, or public code snippets.

## Children’s privacy

This project is intended for professional and technical use in hotel pricing, travel operations, analytics, and AI workflow scenarios. It is not designed for use by children.

## Changes to this policy

This document may be updated as the repository, hosting model, or authentication approach evolves. The latest published version in this repository should be treated as the current public policy for this documentation surface.

## Support and privacy requests

For support or privacy-related questions about this repository and its public documentation surface, please use the public support channel documented in [support.md](support.md). For platform-specific questions related to GitHub, Apify, or Claude clients, users may also need to contact the relevant platform provider directly.
