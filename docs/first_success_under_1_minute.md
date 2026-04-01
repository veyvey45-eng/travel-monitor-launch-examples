## Objectif

Ce guide sert à rendre le **premier essai** du produit aussi simple que possible. Il ne cherche pas à documenter toute l’API. Son rôle est beaucoup plus précis : permettre à un prospect, un partenaire, un intégrateur ou un utilisateur curieux de vérifier en **moins d’une minute** que l’Actor répond, qu’il expose une route exploitable, et qu’il produit un **résultat métier compréhensible**.

Cette logique est essentielle commercialement. Un produit API-first se diffuse beaucoup mieux quand la première réussite est courte, claire et peu risquée. Le bon parcours consiste donc à réduire la démonstration à trois mouvements : **tester la disponibilité**, **voir une route métier**, puis **comparer avec un exemple réel déjà validé**.

| Principe | Pourquoi c’est important |
|---|---|
| **Commencer par un health check** | Donne une confirmation immédiate que l’Actor répond |
| **Montrer ensuite une route métier simple** | Rend la promesse produit concrète |
| **Comparer avec un exemple réel** | Renforce la crédibilité et réduit l’ambiguïté |
| **Limiter le nombre d’étapes** | Réduit la friction avant l’essai |

## Pré-requis

Le parcours ci-dessous suppose que le lecteur dispose d’un **jeton Apify valide**. Selon le mode d’accès exposé par la route métier, une **clé métier privée** peut aussi être requise. Le but n’est pas d’entrer ici dans la logique d’administration des accès, mais de rendre le test le plus direct possible.

| Élément requis | Usage |
|---|---|
| **Jeton Apify** | Autoriser l’appel Standby sur l’Actor |
| **Terminal ou client HTTP** | Exécuter les appels `curl` |
| **Éventuelle clé métier** | Autoriser certaines routes métier si nécessaire |

## Chemin de premier succès recommandé

Le parcours le plus court est le suivant. Il peut être repris tel quel dans un README GitHub, un e-mail d’outreach, une page Notion, un post communautaire ou un guide d’onboarding.

| Étape | Action | Résultat attendu |
|---|---|---|
| **1** | Ouvrir la fiche publique de l’Actor | Le lecteur comprend le cas d’usage |
| **2** | Tester `/health` | Le service répond correctement |
| **3** | Tester `/travel/opportunities/feed` | Une sortie métier devient visible |
| **4** | Comparer avec le payload démonstratif | La valeur produit devient concrète |
| **5** | Continuer vers les autres exemples si besoin | Le lecteur peut approfondir |

## Étape 1 — Ouvrir la fiche publique

Commencez par la fiche publique de l’Actor afin de disposer du point d’entrée officiel.

```text
https://apify.com/travelmonitorlab/travel-monitor-launch
```

Pour les canaux suivis, la version tracée recommandée est la suivante.

```text
https://apify.com/travelmonitorlab/travel-monitor-launch?utm_source=examples&utm_medium=first_success&utm_campaign=launch_april_2026
```

## Étape 2 — Vérifier que l’Actor répond

Le **health check** est l’étape qui doit toujours réussir en premier. Elle rassure immédiatement l’utilisateur sur la disponibilité de la surface exposée.

```bash
curl "https://travelmonitorlab--travel-monitor-launch.apify.actor/health?token=<YOUR_APIFY_TOKEN>"
```

Une réponse saine doit confirmer que le service est joignable. Même si sa structure exacte peut évoluer, cette étape a surtout un rôle de **preuve d’accessibilité**.

| Si le test réussit | Interprétation |
|---|---|
| **La route répond rapidement** | L’Actor est joignable |
| **Le format de réponse est lisible** | L’utilisateur peut continuer |
| **Aucune erreur d’authentification** | Le jeton utilisé est correct |

## Étape 3 — Tester une route métier démonstrative

Une fois la disponibilité vérifiée, il faut immédiatement passer à une route qui montre la **valeur métier**. Le meilleur point d’entrée reste le **feed d’opportunités**, car il rend le produit intelligible sans demander au lecteur de parcourir trop de surfaces secondaires.

```bash
curl -H "Authorization: Bearer <YOUR_APIFY_TOKEN>" \
  -H "x-api-key: <YOUR_TRAVEL_API_KEY_IF_REQUIRED>" \
  "https://travelmonitorlab--travel-monitor-launch.apify.actor/travel/opportunities/feed"
```

Si l’utilisateur préfère commencer par une surface encore plus descriptive, il peut aussi consulter le catalogue de plans.

```bash
curl -H "Authorization: Bearer <YOUR_APIFY_TOKEN>" \
  -H "x-api-key: <YOUR_TRAVEL_API_KEY_IF_REQUIRED>" \
  "https://travelmonitorlab--travel-monitor-launch.apify.actor/travel/plans"
```

## Étape 4 — Comparer la sortie à un exemple réel

Le parcours de premier succès doit toujours inclure une **comparaison avec une sortie réelle déjà validée**, afin que l’utilisateur puisse reconnaître immédiatement ce qu’il voit. L’exemple ci-dessous constitue la pièce démonstrative centrale à réutiliser dans les prochains actifs commerciaux.

```json
{
  "feed_rank": 1,
  "opportunity_key": "group_644c57e536983898",
  "destination_label": "Wooster, Ohio",
  "entity_name": "Hampton Inn Wooster (Hotel)",
  "checkin_date": "2026-04-15",
  "checkout_date": "2026-04-16",
  "currency": "USD",
  "opportunity_type": "booking_parity_gap",
  "opportunity_priority": "medium",
  "opportunity_score": 48.82,
  "recommended_offer_tier": "parity",
  "market_leader_site": "trivago",
  "best_price": 136.0,
  "price_gap": 6.0,
  "price_gap_percent": 4.41,
  "booking_gap": 6.0,
  "booking_gap_percent": 4.41,
  "sites": ["booking", "trivago"],
  "commercial_summary": "Booking.com is 6.00 USD above the best observed market rate for Hampton Inn Wooster (Hotel); best visible site: trivago at 136.00 USD."
}
```

| Champ à lire en premier | Ce qu’il démontre |
|---|---|
| **entity_name** | Le signal porte sur un hôtel réel |
| **destination_label** | Le contexte est immédiatement compréhensible |
| **opportunity_score** | Le résultat est priorisé |
| **market_leader_site** | Le comparatif concurrentiel est explicite |
| **price_gap** | La valeur métier est quantifiée |
| **commercial_summary** | Le résultat est lisible pour un décideur |

## Étape 5 — Que faire ensuite ?

Une fois ce premier succès obtenu, l’utilisateur ne doit pas rester sans direction. Il faut lui proposer une suite simple, graduelle et commerciale.

| Profil utilisateur | Suite recommandée |
|---|---|
| **Curieux / évaluateur** | Lire le hub d’exemples et comparer les familles de sorties |
| **Développeur / intégrateur** | Rejouer les snippets et explorer les JSON d’exemple |
| **Décideur métier** | Lire le payload démonstratif et le résumé commercial |
| **Prospect avancé** | Tester un cas d’usage plus ciblé ou demander un exemple adapté |

## Messages courts réutilisables

Ce guide doit aussi servir à l’outreach et aux canaux externes. Les formulations ci-dessous peuvent être reprises dans un e-mail, un DM ou un post communautaire.

| Contexte | Formulation courte |
|---|---|
| **DM / e-mail initial** | “You can verify the Actor in under a minute: start with `/health`, then compare the opportunity feed with a real sample payload.” |
| **Post social** | “First success path: health check, opportunity feed, real parity-gap payload.” |
| **Page d’exemples** | “Start with the health route, then move to the opportunity feed and compare with the real JSON example.” |
| **Réponse à un prospect** | “If useful, I can share the exact first-success path and the sample payload we use for demonstrations.” |

## Limiter le coût perçu de l’essai

Le bon angle commercial n’est pas de promettre un free trial vague, mais un **premier test très limité, très lisible et à faible risque**. Cela réduit fortement l’objection d’essai pour un produit exposé via une marketplace d’Actors.

> **Angle recommandé:** “You do not need to commit to a full integration to evaluate the product. Start with a health check, then run one demonstrative route and compare it with a validated sample payload.”

| Objection fréquente | Réponse recommandée |
|---|---|
| **“Je ne veux pas perdre de temps.”** | Le premier test prend moins d’une minute. |
| **“Je ne sais pas ce que je vais obtenir.”** | Le payload démonstratif montre exactement le type de signal attendu. |
| **“Je ne veux pas engager de coût important.”** | Le premier essai recommandé est volontairement limité et contrôlé. |
| **“Je ne suis pas encore prêt à intégrer.”** | Le premier objectif est seulement de vérifier la valeur et la lisibilité de la sortie. |

## Actifs à relier à ce guide

Ce document devient beaucoup plus utile lorsqu’il est lié à un petit ensemble d’actifs complémentaires.

| Actif lié | Rôle |
|---|---|
| `github_examples_repo_README_2026-04-01.md` | README maître du futur dépôt GitHub |
| `apify_examples_hub_first_success_2026-04-01.md` | Hub d’exemples plus large |
| `demo_feed_item.json` | Preuve démonstrative centrale |
| `demo_opportunities_feed_response.json` | Vue plus complète des sorties |
| `apify_external_discoverability_asset_pack_2026-04-01.md` | Pack maître de messages et de diffusion |

## Conclusion

Le premier succès n’a pas besoin d’être spectaculaire. Il doit surtout être **rapide**, **compréhensible**, **reproductible** et **suffisamment convaincant** pour donner envie d’aller plus loin. Ce guide transforme donc l’Actor en expérience d’essai plus proche d’un produit commercial lisible que d’une simple surface technique.

La suite logique consiste à produire immédiatement les **snippets shell prêts à copier-coller**, puis les **messages d’outreach**, puis les **supports de publication par canal** qui réutiliseront exactement ce même parcours.
