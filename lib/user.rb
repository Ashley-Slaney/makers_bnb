require 'pg'
require 'bcrypt'

class User 
  include BCrypt
    
  attr_reader :id, :name, :email, :password

  def initialize(id:, name:, email:, password:)
    @id = id
    @name = name
    @email = email
    @password = password
  end 

  def self.sign_up(name:, email:, password:)
    password_hash = Password.create(password)
    result = DatabaseConnection.query("INSERT INTO users (name, email, password) VALUES('#{name}', '#{email}', '#{password_hash}') RETURNING id, name, email, password;")
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
  end
  
  def self.find(id:)
  return nil unless id
    if ENV['ENVIRONMENT'] =='test'
      connection = PG.connect(dbname: 'bnb_test')      
    else
      connection = PG.connect(dbname: 'bnb')   
    end
    result = connection.query("SELECT * FROM users WHERE id = '#{id}';")
    User.new(
      id: result[0]['id'],
      name: result[0]['name'],
      email: result[0]['email'],
      password: result[0]['password'],
    )
  end

  def self.authenticate(email:, password:)
    if ENV['ENVIRONMENT'] =='test'
      connection = PG.connect(dbname: 'bnb_test')      
    else
      connection = PG.connect(dbname: 'bnb')   
    end
    result = connection.query("SELECT * FROM users WHERE email = '#{email}'")
    return unless result.any?
    User.new(id: result[0]['id'], name: result[0]['name'], email: result[0]['email'], password: result[0]['password'])
  end
end