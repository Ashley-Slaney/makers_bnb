require 'pg'

def setup_test_database
  "Setting up test database..."
  connection = PG.connect(dbname: 'BnB_test')
  # Clear the bookmarks table
  connection.exec("TRUNCATE users;")
end