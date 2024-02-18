#!/bin/bash

username="freecodecamp"
dbname="salon"

echo -e "\n~~~~~ MY SALON ~~~~~\n"


# Query for the services and format in csv
QUERY_SERVICES=$(psql --username="$username" --dbname="$dbname" -c "COPY (SELECT service_id, name FROM services) TO STDOUT CSV")

echo  -e "Welcome to My Salon, how can I help you?\n"
echo "$QUERY_SERVICES" | while IFS=',' read -r number service; do
    echo "$number) $service"
  done

# Read user input
read SERVICE_ID_SELECTED

# Validate user input
while true; do
    if [[ $SERVICE_ID_SELECTED -ge 1 && $SERVICE_ID_SELECTED -le 5 ]]; then
        break  # Valid input, exit the loop
    else
        echo -e "\nInvalid choice. Please select a valid service."
        echo  -e "Welcome to My Salon, how can I help you?"
        echo "$QUERY_SERVICES" | while IFS=',' read -r number service; do
            echo "$number) $service"
          done
        read SERVICE_ID_SELECTED
    fi
done

# Ask user about phone number
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE

# Query user's phone number in csv format
query_customer(){
  QUERY_PHONE=$(psql --username="$username" --dbname="$dbname" -c "COPY (SELECT customer_id, name, phone FROM customers WHERE phone = '$CUSTOMER_PHONE' FETCH FIRST 1 ROW ONLY) TO STDOUT CSV")
}

query_customer
# Check if $query_phone has no matching value(s)
if [[ -z "$QUERY_PHONE" ]]; then
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    psql --username="$username" --dbname="$dbname" -c -q "INSERT INTO customers (name, phone) VALUES ('$CUSTOMER_NAME', '$CUSTOMER_PHONE')"
fi

query_customer
CUSTOMER_ID=$(echo "$QUERY_PHONE" | cut -d ',' -f 1)
CUSTOMER_NAME=$(echo "$QUERY_PHONE" | cut -d ',' -f 2)



echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME? "
read SERVICE_TIME

# Define a regular expression pattern
pattern='^([0-1][0-9]|2[0-3]):[0-5][0-9]$'

# Insert the provided credentials to the appointments table
SERVICE_ID=$SERVICE_ID_SELECTED
psql --username="$username" --dbname="$dbname" -c -q "INSERT INTO appointments (customer_id, service_id, time) VALUES ('$CUSTOMER_ID', '$SERVICE_ID', '$SERVICE_TIME')"

SERVICE_NAME=$(echo "$QUERY_SERVICES" | grep "^$SERVICE_ID_SELECTED," | cut -d ',' -f 2)

echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
