# HEARTBEAT.md

## Email Monitoring (Every Heartbeat)
1. Check `memory/email-state.json` for `lastCheckedAt`
2. Use AppleScript to fetch new emails since last check from:
   - andrew.khang@m0.xyz
   - ajkhang@gmail.com
3. For each new email, analyze for:
   - **Action items** → add to `life/areas/projects/action-items/items.json`
   - **Coaching context** → note leadership-relevant signals
   - **Urgency** → ping Andrew via Telegram if time-sensitive
4. Update `memory/email-state.json` with new timestamp and processed IDs

## Fact Extraction (Every Heartbeat)
1. Check `memory/extraction-state.json` for `lastExtractedAt`
2. If >30 min since last extraction OR new daily notes exist:
   - Spawn cheap sub-agent (model: `anthropic/claude-3-haiku-20240307`) to:
     - Read recent `memory/YYYY-MM-DD.md` entries since last extraction
     - Extract durable facts about people, companies, projects
     - Write to relevant `life/areas/[type]/[name]/items.json`
     - Update `memory/extraction-state.json` with new timestamp
3. Focus on: relationships, status changes, milestones, preferences
4. Skip: casual chat, temporary info, one-off events

## What to Extract
- New people mentioned (create entity if significant)
- Status changes ("started new job", "no longer at X")
- Relationship updates ("difficult manager" → "former manager")
- Milestones ("company raised Series B", "project launched")
- Stated preferences ("prefers morning meetings")

## Self-Funding Review (Weekly)
- Brainstorm ways to cover ~$200/mo cost
- Log ideas to `life/areas/projects/self-funding/items.json`
- Prioritize: cost savings > productivity gains > revenue ideas

## Slack Monitoring (Daily - 7am & 6pm)
Pull messages from monitored channels (see `config/slack-monitoring.json`):
1. Leadership channels: ecosystem-leadership, ecosystem-dev, ecosystem-ops, m0-northstar
2. Hiring: hiring-senior-counsel, temp-head-of-insti-sales-hiring
3. NYC office channel
4. All #project-* channels
5. Priority leadership group DMs (Luca, Greg, Joao combinations)

Use slackdump to pull last 24h of messages. Store observations in knowledge graph.

## Andrew Coaching (Daily)
When reviewing Slack:
1. Look for: assert/defer patterns, missed opportunities to lead, strategic vs operational framing
2. If a teachable moment is found, note it for morning brief
3. Track observations in `life/areas/projects/andrew-coaching/`

## Daily Retrospective (Evening)
At end of day (~6pm or last heartbeat before midnight):
1. **What went well?** — Tasks completed, good decisions, wins
2. **What didn't go well?** — Mistakes, inefficiencies, missed opportunities
3. **Areas to improve** — Skills, processes, knowledge gaps
4. **Experiment to try** — One new thing for tomorrow (skill, tool, approach)

Log to `life/areas/projects/self-improvement/items.json`
Surface experiment recommendation in morning brief
