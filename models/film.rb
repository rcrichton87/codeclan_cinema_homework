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
    @available_tickets = options['available_tickets'].to_i
  end

  def save
    sql = "INSERT INTO films (title, price, available_tickets) VALUES ('#{@title}', #{@price}, #{@available_tickets};"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def self.delete_all
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

end