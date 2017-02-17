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

end