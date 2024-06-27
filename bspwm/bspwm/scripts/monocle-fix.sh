#!/usr/bin/env bash
GAPLESS=$(bspc config gapless_monocle)
WINDOW_GAP=$(bspc config window_gap)

bspc subscribe desktop_layout | while read -r Event; do
    DESKTOP=$(cut -d ' ' -f 3 <<<"$Event")
    STATE=$(cut -d ' ' -f 4 <<<"$Event")

    bspc query -N -d "$DESKTOP" | while read -r Node; do

        if [ "$STATE" = "monocle" ] && [ "$GAPLESS" = "true" ]; then
            xprop -id "$Node" -f _PICOM_ROUNDED 32c -set _PICOM_ROUNDED 1
        elif [ $WINDOW_GAP -gt 0 ]; then
            xprop -id "$Node" -remove _PICOM_ROUNDED
        fi
    done
done
