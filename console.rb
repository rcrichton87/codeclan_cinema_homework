require('pry')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')

#Ticket.delete_all
Customer.delete_all
#Film.delete_all

customer1 = Customer.new( {'name' => 'Ross', 'funds' => 50} )
customer1.save

customer2 = Customer.new( {'name' => 'Paul', 'funds' => 70} )
customer2.save

customer3 = Customer.new( {'name' => 'Mike', 'funds' => 85} )
customer3.save

customer4 = Customer.new( {'name' => 'Cara', 'funds' => 150} )
customer4.save

binding.pry
nil