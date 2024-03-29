WINDOW_TITLE=$(yabai -m query --windows --window | jq -r '.title' | cut -c 1-50)
APP=$(yabai -m query --windows --window | jq -r '.app')
ICON=$($HOME/.config/sketchybar/plugins/icons.sh $APP)

sketchybar -m --set focus icon.drawing=on label.drawing=on

if [[ $APP = "Safari" ]]; then
  WINDOW_TITLE=${WINDOW_TITLE/, Private Browsing/""}
fi

if [[ $APP = "Discord" ]]; then
  WINDOW_TITLE=${WINDOW_TITLE/- Discord/""}
fi

if [[ ${#WINDOW_TITLE} -gt 75 ]]; then
  WINDOW_TITLE=$(echo "$WINDOW_TITLE" | cut -c 1-75)…
fi

if [[ $APP = "" ]]; then
  sketchybar -m --set focus icon.drawing=off label.drawing=off
  exit 0
fi

if [[ $APP = $WINDOW_TITLE ]]; then
  sketchybar -m --set focus label="$APP" icon="$ICON"
  exit 0
fi

sketchybar -m --set focus label="$APP / $WINDOW_TITLE"
sketchybar -m --set focus icon="$ICON"
