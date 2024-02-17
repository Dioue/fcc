
# A query viewer and deleter for 'appointments' and 'customers' table in the 'salon' database.

USERNAME="freecodecamp"
DB="salon"

psql --username=$USERNAME --dbname=$DB -c "SELECT * FROM appointments;"
psql --username=$USERNAME --dbname=$DB -c "SELECT * FROM customers;"
psql --username=$USERNAME --dbname=$DB -c "DELETE FROM appointments;"
psql --username=$USERNAME --dbname=$DB -c "DELETE FROM customers;"