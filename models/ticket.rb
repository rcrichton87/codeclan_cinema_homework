require_relative('./film.rb')
require_relative('./customer.rb')
require_relative('../db/sql_runner.rb')

class Ticket

  attr_reader :id, :customer_id, :film_id
  attr_accessor :time

  def initialize(options)
    @id = options['id'].to_i
    @customer_id = options['customer_id'].to_i
    @film_id = options['film_id'].to_i
    @time = options['time']
  end

  def self.get_many(sql)
    tickets = SqlRunner.run(sql)
    return tickets.map{|ticket| Ticket.new(ticket)}
  end

  def save
    sql = "INSERT INTO tickets (customer_id, film_id, time) VALUES (#{@customer_id}, #{@film_id}, '#{@time}') RETURNING *;"
    ticket = SqlRunner.run(sql).first
    @id = ticket['id'].to_i
  end 

  def self.all
    sql = "SELECT * FROM tickets;"
    return self.get_many(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * from tickets WHERE id = #{id};"
    ticket = SqlRunner.run(sql).first
    return Ticket.new(ticket)
  end

  def customer
    sql = "SELECT * from customers WHERE id = #{@customer_id};"
    customer = SqlRunner.run(sql).first
    return Customer.new(customer)
  end

  def film
    sql = "SELECT * from films WHERE id = #{@film_id};"
    film = SqlRunner.run(sql).first
    return Film.new(film)
  end

  def update
    sql = "UPDATE tickets SET (time) = ('#{@time}') WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM tickets;"
    SqlRunner.run(sql)
  end

  def delete
    sql = "DELETE FROM tickets WHERE id = #{@id};"
    SqlRunner.run(sql)
  end

 

end