require 'pg'

class Space 
    attr_reader :id, :name, :description, :price, :date_avail, :host_email
    
    def initialize(id:, name:, description:, price:, date_avail:, host_email:)
      @id = id
      @name = name
      @description = description
      @price = price
      @date_avail = date_avail
      @host_email = host_email
    end

    def self.create(name:, description:, price:, date_avail:, host_email:)
      result = DatabaseConnection.query("INSERT INTO spaces (name, description, price, date_avail, host_email) VALUES('#{name}', '#{description}', '#{price}', '#{date_avail}', '#{host_email}') RETURNING name, description, price, date_avail, host_email;")
      Space.new(
        id: result[0]['id'], 
        name: result[0]['name'], 
        description: result[0]['description'], 
        price: result[0]['price'],
        date_avail: result[0]['date_avail'],
        host_email: result[0]['host_email']
      )
    end



    def self.filter(date_avail:)
      result = DatabaseConnection.query("SELECT * FROM spaces WHERE date_avail = '#{date_avail}';")
      result.map do |spaces|
        Space.new(
        id: result[0]['id'], 
        name: result[0]['name'], 
        description: result[0]['description'], 
        price: result[0]['price'],
        date_avail: result[0]['date_avail'],
        host_email: result[0]['host_email']
      )
    end
  end

  def self.list_spaces_by_email(host_email:)
    result = DatabaseConnection.query("SELECT * FROM spaces WHERE host_email = '#{host_email}';")
    # result.map do |spaces|
    #   Space.new(
    #     id: result[0]['id'], 
    #     name: result[0]['name'], 
    #     description: result[0]['description'], 
    #     price: result[0]['price'],
    #     date_avail: result[0]['date_avail'],
    #     host_email: result[0]['host_email']
    #   )
    #   result.each do |space|
    #     Space.new(
    #     id: space['id'],
    #     name: space['name'],
    #     description: space['description'],
    #     price: space['price'],
    #     date_avail: space['date_avail'],
    #     host_email: space['host_email']
    #     )
    #   end
    # end
  end

  

    def self.all
      result = DatabaseConnection.query("SELECT * FROM spaces;")
      result.map do |spaces|
        Space.new(
        id: spaces['id'],  
        name: spaces['name'],
        description: spaces['description'],
        price: spaces['price'],
        date_avail: spaces['date_avail'],
        host_email: result[0]['host_email']
        )
    end
  end
end

