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

  def self.get_many(sql)
    films = SqlRunner.run(sql)
    result = films.map{|film| Film.new(film)}
    return result
  end

  def save
    sql = "INSERT INTO films (title, price, available_tickets) VALUES ('#{@title}', #{@price}, #{@available_tickets})  RETURNING *;"
    film = SqlRunner.run(sql).first
    @id = film['id'].to_i
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM films WHERE id = #{id};"
    film = SqlRunner.run(sql).first
    return Film.new(film)
  end

  def self.all
    sql = "SELECT * FROM films;"
    return self.get_many(sql)
  end

  def customers
    sql = "SELECT customers.* FROM customers
    INNER JOIN tickets ON customers.id = tickets.customer_id
    WHERE tickets.film_id = #{@id};"
    Customer.get_many(sql)
  end

  def tickets
    sql = "SELECT * FROM tickets WHERE film_id = #{@id};"
    Ticket.get_many(sql)
  end

  def number_of_customers
    number_of_customers = self.customers.length
    return number_of_customers
  end

  def most_popular_time
    tickets = self.tickets #make an array of all tickets for the film
    most_popular_ticket = []
    while tickets.length != 0
      search_ticket = tickets[0] #search based on the first ticket in the array
      tickets_at_time = tickets.find_all {|ticket| ticket.time == search_ticket.time} #put all tickets matching the search ticket's time in an array
      if tickets_at_time.length > most_popular_ticket.length #if the length of the array of found tickets is larger than the current most popular
        most_popular_ticket = tickets_at_time
      end
      tickets.shift #remove the first item now that it's been searched
    end
    return most_popular_ticket[0].time #all times in the array will be the same, return the first
  end

  def update
    sql = "UPDATE films SET (title, price, available_tickets) = ('#{@title}', #{@price}, #{@available_tickets}) WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM films;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM films WHERE id = #{@id};"
    SqlRunner.run(sql)
  end



end