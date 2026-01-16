#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME';")
USER_DATA=$(echo $USER_DATA | tr -d '[:space:]')

if [[ -z $USER_DATA ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."

  INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")
  GAMES_PLAYED=0
  BEST_GAME=0
else
  GAMES_PLAYED=$(echo $USER_DATA | cut -d'|' -f1)
  BEST_GAME=$(echo $USER_DATA | cut -d'|' -f2)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
NUM_GUESSES=0

echo "Guess the secret number between 1 and 1000:"

while true; do
  read GUESS

  if ! [[ $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  ((NUM_GUESSES++))

  if (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  elif (( GUESS > SECRET_NUMBER )); then
    echo "It's lower than that, guess again:"
  else
   echo "You guessed it in $NUM_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"

   GAMES_PLAYED=$((GAMES_PLAYED + 1))
   if [[ $BEST_GAME -eq 0 || $NUM_GUESSES -lt $BEST_GAME ]]; then
      BEST_GAME=$NUM_GUESSES
    fi
    $PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME';"
    break
  fi
done

# commit 1: add database connection