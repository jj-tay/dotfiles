#!/bin/bash
input=$(cat)
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
repo=$(echo "$input" | jq -r '.workspace.repo | if . then .owner + "/" + .name else empty end')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five_hour=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
seven_day=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

out=""

# Location: prefer repo owner/name, fall back to shortened cwd
if [ -n "$repo" ]; then
  out=$(printf '\033[33m%s\033[0m' "$repo")
elif [ -n "$cwd" ]; then
  short_cwd="${cwd/#$HOME/~}"
  out=$(printf '\033[33m%s\033[0m' "$short_cwd")
fi

# Model display name
if [ -n "$model" ]; then
  model_str=$(printf '\033[36m%s\033[0m' "$model")
  [ -n "$out" ] && out="$out  $model_str" || out="$model_str"
fi

# Context window usage
if [ -n "$used" ]; then
  used_int=$(printf '%.0f' "$used")
  ctx_str=$(printf '\033[90mctx %s%%\033[0m' "$used_int")
  [ -n "$out" ] && out="$out  $ctx_str" || out="$ctx_str"
fi

# Rate limit usage (Claude.ai subscribers only; absent until first API response)
rate_parts=""
[ -n "$five_hour" ] && rate_parts="5h:$(printf '%.0f' "$five_hour")%"
if [ -n "$seven_day" ]; then
  seven_str="7d:$(printf '%.0f' "$seven_day")%"
  [ -n "$rate_parts" ] && rate_parts="$rate_parts $seven_str" || rate_parts="$seven_str"
fi
if [ -n "$rate_parts" ]; then
  rate_str=$(printf '\033[35m%s\033[0m' "$rate_parts")
  [ -n "$out" ] && out="$out  $rate_str" || out="$rate_str"
fi

printf '%s\n' "$out"
