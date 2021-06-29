require 'pg'

class User 
    
  attr_reader :id, :email, :password

  def initialize(id:, email:, password:)
    @id = id
    @email = email
    @password = password
  end 

  def self.sign_up(name:, email:, password:)
    if ENV['ENVIRONMENT'] =='test'
      connection = PG.connect(dbname: 'bnb_users_test')      
    else
      connection = PG.connect(dbname: 'bnb_users')   
    end
    
    connection.exec("INSERT INTO user (name, email, password) VALUES('#{name}', '#{email}', '#{password}' RETURNING name;")
  end

end