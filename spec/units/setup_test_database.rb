require 'pg'

def setup_test_database
  "Setting up test database..."
  connection = PG.connect(dbname: 'bnb_test')
  # Clear the user_test tables
  connection.exec("TRUNCATE spaces, users;")
end