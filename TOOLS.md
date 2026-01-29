# TOOLS.md - Local Notes

Skills define *how* tools work. This file is for *your* specifics — the stuff that's unique to your setup.

---

## Slack (M0 Workspace)

**Workspace:** mzerolabs.slack.com
**Tool:** slackdump (CLI)
**Auth:** Token + cookie stored in slackdump cache

### Quick Commands
```bash
# List all channels
PATH=$PATH:/usr/sbin slackdump list channels

# Read messages from a channel
PATH=$PATH:/usr/sbin slackdump dump <channel-id> -limit 50

# Wrapper script
./scripts/slack-read.sh <channel-id> [limit]
```

### Key Channels
- `C04RSEUBMRP` — #general
- `C0501017LRY` — #engineering
- `C04SW6KTRBR` — #team-backend
- `C04TM71SQN6` — #helpdesk
- `C051PGD6J2J` — #random

### Notes
- Token expires periodically — may need to refresh `d` cookie from browser
- Use `PATH=$PATH:/usr/sbin` prefix (ioreg path issue)

---

## Calendar (macOS Calendar + icalBuddy)

**Tool:** icalBuddy (CLI)
**Calendars synced:** andrew.khang@m0.xyz, ajkhang@gmail.com, Family, Work, M0 Offsite

### Quick Commands
```bash
# List all calendars
icalBuddy calendars

# Today's events
icalBuddy eventsToday

# Today + tomorrow
icalBuddy eventsToday+1

# Specific calendars only
icalBuddy -ic "andrew.khang@m0.xyz,ajkhang@gmail.com" eventsToday
```

---

## What Goes Here

Things like:
- Camera names and locations
- SSH hosts and aliases  
- Preferred voices for TTS
- Speaker/room names
- Device nicknames
- Anything environment-specific

---

Add whatever helps you do your job. This is your cheat sheet.
