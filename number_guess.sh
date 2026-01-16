#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]]
then
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')" > /dev/null
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_guesses) FROM games WHERE user_id=$USER_ID")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

SECRET=$(( RANDOM % 1000 + 1 ))
TRIES=0

echo "Guess the secret number between 1 and 1000:"

while read GUESS
do
  if [[ ! $GUESS =~ ^[0-9]+$ ]]
  then
    echo -n "That is not an integer, guess again:"
    continue
  fi

  TRIES=$((TRIES+1))

  if [[ $GUESS -eq $SECRET ]]
  then
    break
  elif [[ $GUESS -gt $SECRET ]]
  then
    echo -n "It's lower than that, guess again:"
  else
    echo -n "It's higher than that, guess again:"
  fi
done

echo "You guessed it in $TRIES tries. The secret number was $SECRET. Nice job!"
$PSQL "INSERT INTO games(number_guesses, user_id) VALUES($TRIES, $USER_ID)" > /dev/null