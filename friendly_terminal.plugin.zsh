USER=$(whoami)
DAY=$(date +"%A")
TIME=$(expr $(date +"%H"))

function timeOfDay() {
    if [[ $TIME -le 2 ]] || [[ $TIME -ge 18 ]]; then
        TIMEOFDAY='evening'
    elif [[ $TIME -le 12 ]]; then
        TIMEOFDAY='morning'
    else
        TIMEOFDAY='afternoon'
    fi
}

function dayOrNight() {
    if [[ $TIME -le 4 ]] || [[ $TIME -ge 20 ]]; then
        DAYORNIGHT='night'
    else
        DAYORNIGHT='day'
    fi
}

timeOfDay
dayOrNight

shuf ~/.oh-my-zsh/plugins/friendly_terminal/quotes_for_terminal.txt \
    | head -n 1 \
    | sed "s/%(name)s/$USER/g" \
    | sed "s/%(dayOfWeek)s/$DAY/g" \
    | sed "s/%(timeOfDay)s/$TIMEOFDAY/g" \
    | sed "s/%(dayOrNight)s/$DAYORNIGHT/g" \
    | sed "s/%(todayOrTonight)s/to$DAYORNIGHT/g"
