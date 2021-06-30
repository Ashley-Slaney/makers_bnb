require 'pg'

def setup_test_database
  "Setting up test database..."
  connection = PG.connect(dbname: 'bnb_test')
  # Clear the bookmarks table
  connection.exec("TRUNCATE space, space;")
end