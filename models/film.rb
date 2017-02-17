require_relative('./ticket.rb')
require_relative('./customer.rb')
require_relative('../db/sql_runner.rb')

class Film

  attr_reader :id
  attr_accessor :title, :price, :available_tickets

  def initialize(options)
    @id = options['id'].to_i
    @title = options['title']
    @price = options['price'].to_i
    @available_tickets = options['available_tickets']
  end

end