require 'pg'

class Space 
    attr_reader :id, :name, :description, :price 
    
    def initialize(id:, name:, description:, price:)
      @id = id
      @name = name
      @description = description
      @price = price
    end

    def self.all
      result = DatabaseConnection.query("SELECT * FROM spaces;")
      result.map do |spaces|
        Space.new(
        name: spaces['name'],
        description: spaces['description'],
        price: spaces['price']
        )
    end
  end

    def self.create(name:, description:, price:)
      result = DatabaseConnection.query("INSERT INTO spaces (name, description, price) VALUES('#{name}', '#{description}', '#{price}') RETURNING name, description, price;")
      Space.new(id: result[0]['id'], name: result[0]['name'], description: result[0]['description'], price: result[0]['price'])
    end
end



