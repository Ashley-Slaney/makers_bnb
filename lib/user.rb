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

end