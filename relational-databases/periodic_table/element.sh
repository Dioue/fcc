#!/bin/bash
# psql properties do not modify :)
PSQL_USERNAME=freecodecamp
PSQL_DB=periodic_table

# program starts here
# check if there is an argument $1 passed;
find_element(){
if [[ -n $1 ]]; then
  if [[ "$1" =~ ^[0-9]+$ ]]; then
  ATOMIC_INFO=$(psql --username=$PSQL_USERNAME --dbname=$PSQL_DB -t --no-align -c "SELECT elements.*, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, types.type FROM elements JOIN properties ON elements.atomic_number = properties.atomic_number JOIN types ON properties.type_id = types.type_id WHERE elements.atomic_number = $1;")
  else
    ATOMIC_INFO=$(psql --username=$PSQL_USERNAME --dbname=$PSQL_DB -t --no-align -c "SELECT elements.*, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, types.type FROM elements JOIN properties ON elements.atomic_number = properties.atomic_number JOIN types ON properties.type_id = types.type_id WHERE elements.symbol = '$1';")
      if [[ -z $ATOMIC_INFO ]]; then
      ATOMIC_INFO=$(psql --username=$PSQL_USERNAME --dbname=$PSQL_DB -t --no-align -c "SELECT elements.*, properties.atomic_mass, properties.melting_point_celsius, properties.boiling_point_celsius, types.type FROM elements JOIN properties ON elements.atomic_number = properties.atomic_number JOIN types ON properties.type_id = types.type_id WHERE elements.name = '$1';")
      fi
  fi
  if [[ -n $ATOMIC_INFO ]]; then
    echo $ATOMIC_INFO | while IFS='|' read -r number symbol name mass melt boil type; do
      echo "The element with atomic number $number is $name ($symbol). It's a $type, with a mass of $mass amu. $name has a melting point of $melt celsius and a boiling point of $boil celsius."
    done
  else
  echo "I could not find that element in the database."
  fi
else
echo "Please provide an element as an argument."
fi
}
find_element $1