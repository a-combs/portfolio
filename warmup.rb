foods = [ "BBQ", "TexMex", "Pasta" ]
puts "I like to eat...#{foods[0]}"

class User
	attr_accessor :first_name, :last_name
	
	def initialize(first_name, last_name, admin)
		@first_name = first_name
		@last_name = last_name
		@admin = admin
	end

	def full_name
		"#{@first_name} #{@last_name}"
	end

	def toggle_admin
		@admin = !@admin

end
