require 'pg'

class Space 
    attr_reader :id, :name, :description, :price, :date_avail
    
    def initialize(id:, name:, description:, price:, date_avail:)
      @id = id
      @name = name
      @description = description
      @price = price
      @date_avail = date_avail
    end

    def self.all
      result = DatabaseConnection.query("SELECT * FROM spaces;")
      result.map do |spaces|
        Space.new(
        id: spaces['id'],  
        name: spaces['name'],
        description: spaces['description'],
        price: spaces['price'],
        date_avail: spaces['date_avail']
        )
    end
  end

    def self.create(name:, description:, price:, date_avail:)
      result = DatabaseConnection.query("INSERT INTO spaces (name, description, price, date_avail) VALUES('#{name}', '#{description}', '#{price}', '#{date_avail}') RETURNING name, description, price, date_avail;")
      Space.new(
        id: result[0]['id'], 
        name: result[0]['name'], 
        description: result[0]['description'], 
        price: result[0]['price'],
        date_avail: result[0]['date_avail']
      )
    end

    def self.filter(date_avail:)
      result = DatabaseConnection.query("SELECT * FROM spaces WHERE date_avail = '#{date_avail}';")
      Space.new(
        id: result[0]['id'], 
        name: result[0]['name'], 
        description: result[0]['description'], 
        price: result[0]['price'],
        date_avail: result[0]['date_avail']
      )
    end
end



