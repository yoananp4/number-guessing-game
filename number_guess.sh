#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_DATA=$($PSQL "SELECT games_played, best_game FROM users WHERE username='$USERNAME';")
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM user INNER JOIN games USING(user_id) WHERE username = '$USERNAME'")
BEST_GAME=$($PSQL "SELECT MIN(number_guesses) FROM useres INNER JOIN games USING(user_id) WHERE username = '$USERNAME'")

if [[ $USER_DATA ]]; 
  then
    INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
    echo "Welcome, $USERNAME! It looks like this is your first time here."
else
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

RANDOM_NUM=$((1 + RANDOM % 1000))
GUESS=1

echo "Guess the secret number between 1 and 1000:"

while read NUM 
do
  if [[ ! $NUM =~ ^[0-9]+$ ]] 
    then
      echo "That is not an integer, guess again:"
    else
    if [[ $NUM -eq $RANDOM_NUM ]]
      then
      break;
      else
        if [[ $NUM -gt $RANDOM_NUM ]]
        then
          echo -n "It's lower than that, guess again:"
        elif [[ $NUM -lt $RANDOM_NUM ]]
        then
          echo -n "It's higher than that, guess again:"
        fi
      fi
    fi
    GUESS=$(( $GUESS + 1 ))
done

if [[ $GUESS == 1 ]]
  then 
    echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUM. Nice job!"
  else
    echo "You guessed it in $GUESS tries. The secret number was $RANDOM_NUM. Nice job!"
fi

if [[ $BEST_GAME -eq 0 || $NUM_GUESSES -lt $BEST_GAME ]]; then
      BEST_GAME=$NUM_GUESSES
    fi
    $PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME';"
    break
  fi
done

# commit 1: add database connection