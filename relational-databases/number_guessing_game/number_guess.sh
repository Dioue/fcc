#!/bin/bash
# psql database properties
PSQL_USERNAME=freecodecamp
PSQL_DB=number_guess

#Code starts here
# Title

echo -e "\n~~~ Number Guessing Game ~~~\n"
echo "Enter your username:"
read USERNAME
while [[ -z $USERNAME ]]; do
  echo "Enter your username:"
  read USERNAME
done
if [ ${#USERNAME} -gt 22 ]; then
  echo "Username max limit is less than 23."
fi
update(){
  QUERY_USER=$(psql --username=$PSQL_USERNAME --dbname=$PSQL_DB -t --no-align -c "SELECT * FROM users WHERE name = '$USERNAME'")
}

# Get an update to the database by pulling the user associated with the username value
# and filter out logic depending on the returned value -joe
update
if [[ -z $QUERY_USER ]]; then
  # insert into the database and return the user_id
  USER_ID=$(psql -U $PSQL_USERNAME -d $PSQL_DB -t -q --no-align -c "INSERT INTO users (name) VALUES ('$USERNAME') RETURNING user_id;")
  # update the query user value
  update
  echo $QUERY_USER | while IFS='|' read -r id name; do
    echo "Welcome, $name! It looks like this is your first time here."
  done
else
  USER_ID=$(echo "$QUERY_USER" | cut -d '|' -f 1)
  USER_NAME=$(echo "$QUERY_USER" | cut -d '|' -f 2)
  MATCH_HISTORY=$(psql --username=$PSQL_USERNAME --dbname=$PSQL_DB -t --no-align -c "SELECT * FROM games WHERE user_id = $USER_ID")
  GAMES_PLAYED=$(psql --username=$PSQL_USERNAME --dbname=$PSQL_DB -t --no-align -c "SELECT COUNT(*) FROM games WHERE games.user_id = $USER_ID")
  BEST_GAME=$(psql --username=$PSQL_USERNAME --dbname=$PSQL_DB -t --no-align -c "SELECT MIN(guess_count) FROM games WHERE user_id = $USER_ID;")
  echo "Welcome back, $USER_NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Game start
# Generate a random number between 1 and 1000
SECRET_NUMBER=$((1 + $RANDOM % 10))
# STORE GUESS_COUNT
GUESS_COUNT=0
echo "Guess the secret number between 1 and 1000:"
read GUESS
# function to increase the game guess count filtered by game_id and user_id
increase_guess_count(){
((GUESS_COUNT++))
}

while [[ $GUESS != $SECRET_NUMBER ]]; do
  if [[ $GUESS =~ ^-?[0-9]+$ ]]; then
    increase_guess_count
    if [[ $GUESS -lt $SECRET_NUMBER ]]; then
      echo "It's higher than that, guess again:"
      read GUESS
    elif [[ $GUESS -gt $SECRET_NUMBER ]]; then
      echo "It's lower than that, guess again:"
      read GUESS
    fi
  else
    increase_guess_count
    echo "That is not an integer, guess again:"
    read GUESS
  fi
done

# count the corrent try
# populate the games table with the game records.
increase_guess_count
psql -U $PSQL_USERNAME -d $PSQL_DB -t -q --no-align -c "INSERT INTO games (user_Id, number_to_guess, guess_count) VALUES ('$USER_ID', $SECRET_NUMBER, $GUESS_COUNT)"

# echo the winning prompt
echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"