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

end