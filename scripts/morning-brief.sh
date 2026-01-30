#!/bin/bash
# Morning Brief Generator for Bernard
# Run at 7:00am to prep data for 7:30am brief

set -e

export PATH="/Users/bernard/.bun/bin:$PATH"

WORKSPACE="/Users/bernard/clawd"
OUTPUT_DIR="$WORKSPACE/temp/morning-brief"
DATE=$(date +%Y-%m-%d)
DAY_NAME=$(date +%A)

mkdir -p "$OUTPUT_DIR"

echo "=== Morning Brief Prep: $DATE ==="

# 1. Weather
echo "Fetching weather..."
WEATHER=$(curl -s "wttr.in/Brooklyn,NY?format=j1" | jq -r '
  .current_condition[0] as $c |
  .weather[0] as $w |
  "🌤️ **Brooklyn:** \($c.temp_F)°F (feels like \($c.FeelsLikeF)°F) • High \($w.maxtempF)°F / Low \($w.mintempF)°F\nWind \($c.winddir16Point) \($c.windspeedMiles)mph • \($c.humidity)% humidity"
')
echo "$WEATHER" > "$OUTPUT_DIR/weather.txt"
echo "Weather: done"

# 2. Stablecoin news (placeholder - needs Brave API via clawdbot)
echo "Stablecoin news: will be fetched by Bernard"

# 3. Calendar (today)
echo "Fetching calendar..."
CALENDAR=$(icalBuddy -ic "andrew.khang@m0.xyz,ajkhang@gmail.com" -f -nc -nrd eventsToday 2>/dev/null || echo "Calendar unavailable")
echo "$CALENDAR" > "$OUTPUT_DIR/calendar.txt"
echo "Calendar: done"

# 4. Token tracking placeholder
echo "Token tracking: will be calculated by Bernard"

echo ""
echo "=== Prep complete. Bernard will compile final brief. ==="
