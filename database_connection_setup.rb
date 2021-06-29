require './lib/database_connection'

  if ENV['ENVIRONMENT'] == 'test'
    DatabaseConnection.setup('BnB_test')
  else
    DatabaseConnection.setup('BnB')
  end