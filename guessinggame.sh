#!/usr/bin/env bash
# File: guessinggame.sh

get_file_count() {
    ls -1A | wc -l | sed 's/[^0-9]*//g'
}

play_game() {
    local correct_answer=$(get_file_count)
    local guess=-1

    echo "Welcome to the Guessing Game!"
    echo "How many files are in the current directory?"
    echo "Try to guess the correct number!"

    while [[ $guess -ne $correct_answer ]]; do
        read -p "Enter your guess: " guess

        if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a valid positive number."
            continue
        fi

        if [[ $guess -lt $correct_answer ]]; then
            echo "Your guess is too low. Try again!"
        elif [[ $guess -gt $correct_answer ]]; then
            echo "Your guess is too high. Try again!"
        else
            echo "Congratulations! You guessed the correct number of files: $correct_answer"
        fi
    done
}

play_game
