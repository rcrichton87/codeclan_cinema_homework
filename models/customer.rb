require_relative('../db/sql_runner.rb')
require_relative('./film.rb')
require_relative('./ticket.rb')

class Customer

  attr_reader :id
  attr_accessor :name, :funds

  def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds'].to_i
  end

  def get_many(sql)
    customers = SqlRunner.run(sql)
    result = customers.map{|customer| Customer.new(customer)}
    return result
  end
  
  #create

  def save
    sql = "INSERT INTO customers (name, funds) VALUES ('#{@name}', #{@funds}) RETURNING *;"
    customer = SqlRunner.run(sql).first
    @id = customer['id'].to_i
  end

  #read

  # def self.all

  # end

  #update

  #delete

  def self.delete_all
    sql = "DELETE FROM customers;"
    SqlRunner.run(sql)
  end

end