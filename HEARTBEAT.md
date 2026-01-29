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

## Andrew Coaching (Daily)
When Andrew is active, periodically review recent Slack conversations:
1. Use slackdump to pull recent messages from key leadership channels
2. Look for: assert/defer patterns, missed opportunities to lead, strategic vs operational framing
3. If a teachable moment is found, send targeted coaching feedback via Telegram
4. Track observations in `life/areas/projects/andrew-coaching/`
