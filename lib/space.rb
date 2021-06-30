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
      result = DatabaseConnection.exec("SELECT * FROM spaces;")
      result.map do |spaces|
        Space.new(
        name: spaces['name'],
        description: spaces['description'],
        price: spaces['price']
        )
    end
  end

    def self.create
    end
end