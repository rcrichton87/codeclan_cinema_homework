require('pry')
require_relative('./models/customer.rb')
require_relative('./models/film.rb')
require_relative('./models/ticket.rb')

#Ticket.delete_all
Customer.delete_all
Film.delete_all

customer1 = Customer.new({'name' => 'Ross', 'funds' => 50})
customer1.save

customer2 = Customer.new({'name' => 'Paul', 'funds' => 70})
customer2.save

customer3 = Customer.new({'name' => 'Mike', 'funds' => 85})
customer3.save

customer4 = Customer.new({'name' => 'Cara', 'funds' => 150})
customer4.save

film1 = Film.new({'title' => 'Rogue One', 'price' => 10, 'available_tickets' => 5})
film1.save

film2 = Film.new({'title' => 'Godzilla', 'price' => 15, 'available_tickets' => 10})
film2.save

film3 = Film.new({'title' => 'Beetlejuice', 'price' => 5, 'available_tickets' => 15})
film3.save

film4 = Film.new({'title' => 'Spirited Away', 'price' => 20, 'available_tickets' => 3})
film4.save

binding.pry
nil