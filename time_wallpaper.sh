#!/bin/sh
# a small script that set the wallpaper for my computer with nitrogen
# it sets the wallpaper based on the current time
# it was made to be run in the background

refresh=120   # in seconds
min_rating=5  # minimum stars

morning="6"   # when starts the morning ?
day="9"       # when starts the night ?
evening="18"  # when starts the evening ?
night="22"    # when starts the night ?

# directory of time wallpapers
morning_pics="$HOME/.local/share/wallpapers/morning/"
day_pics="$HOME/.local/share/wallpapers/day/"
evening_pics="$HOME/.local/share/wallpapers/evening/"
night_pics="$HOME/.local/share/wallpapers/night/"

while [ true ]; do
    time=$(date +"%H")
    if [ $time -ge $night ] || [[ $time -lt $morning ]]; then
        # night
        killall nitrogen
        nitrogen --set-zoom-fill $night_pics
    elif [ $time -lt $day ]; then
        # morning
        killall nitrogen
        nitrogen --set-zoom-fill $morning_pics
    elif [ $time -lt $evening ]; then
        # day
        killall nitrogen
        nitrogen --set-zoom-fill $day_pics &
    elif [ $day -lt $night ]; then
        # evening
        killall nitrogen
        nitrogen --set-zoom-fill $evening_pics &
    fi

    sleep $refresh
done
