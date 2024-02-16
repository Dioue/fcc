#! /bin/bash

# Define the PostgreSQL connection string based on the argument
if [[ $1 == "test" ]]; then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Check if 'games.csv' exists in the current directory
if [ -f "games.csv" ]; then
    # Use a flag to skip the first line
    header=true

    while IFS=',' read -r year round winner opponent winner_goals opponent_goals; do
      # Skip the first line
      if [ "$header" = true ]; then
        header=false
        continue
      fi

      # Insert winner and opponent into teams table if they don't exist
      $PSQL "INSERT INTO teams (name) SELECT '$winner' WHERE NOT EXISTS (SELECT 1 FROM teams WHERE name='$winner');"
      $PSQL "INSERT INTO teams (name) SELECT '$opponent' WHERE NOT EXISTS (SELECT 1 FROM teams WHERE name='$opponent');"

      # Insert the data in respect to the teams table.
      $PSQL "INSERT INTO games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) \
            SELECT $year, '$round', (SELECT team_id FROM teams WHERE name='$winner'), \
            (SELECT team_id FROM teams WHERE name='$opponent'), $winner_goals, $opponent_goals;"
    done < games.csv
else
    echo "The file 'games.csv' does not exist in the current directory."
fi
