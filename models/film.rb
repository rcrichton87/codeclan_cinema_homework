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