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
    end

    def self.create
    end
end