# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'
	
	def load_data
		puts "Populating database"
		create_admin_accounts
		# register_members

		bake_cakes
		make_drinks
		bake_paninis
		cook_pastas
		mix_salads

		puts "Database populated."
	end

	def create_admin_accounts
		puts "Adding admin."

		admin = User.new(:email => 'admin@example.com', :first_name => 'admin_first', :last_name => 'admin_last', :password => 'adminpassword', :bio => "I am the ADMIN", :admin => true)
		admin.skip_confirmation!
		admin.save

		puts "Admin created."
	end


	def register_members
		puts "Creating test users."

		source_path = Rails.root.join('db', 'seeds_data', 'users.csv')
		contents = CSV.open source_path, headers: true, header_converters: :symbol
		contents.each do |row|
			user = User.new row.to_hash
			user.skip_confirmation!
			user.save
		end

		puts "Finished loading test users."
	end

	def bake_cakes
		puts "Baking cakes."

		source_path = Rails.root.join('db', 'seeds_data', 'Cakes.csv')
		contents = CSV.open source_path, headers: true, header_converters: :symbol
		
		contents.each do |row|
		  Cake.create row.to_hash
		end

		puts "Finished baking cakes."
	end

	def make_drinks
		puts "Making drinks."

		source_path = Rails.root.join('db', 'seeds_data', 'Drinks.csv')
		contents = CSV.open source_path, headers: true, header_converters: :symbol
		
		contents.each do |row|
		  Drink.create row.to_hash
		end

		puts "Finished making drinks."
	end

	def bake_paninis
		puts "Baking paninis."

		source_path = Rails.root.join('db', 'seeds_data', 'Paninis.csv')
		contents = CSV.open source_path, headers: true, header_converters: :symbol
		
		contents.each do |row|
		  Panini.create row.to_hash
		end

		puts "Finished baking paninis."
	end

	def cook_pastas
		puts "Cooking pastas."

		source_path = Rails.root.join('db', 'seeds_data', 'Pastas.csv')
		contents = CSV.open source_path, headers: true, header_converters: :symbol
		
		contents.each do |row|
		  Pasta.create row.to_hash
		end

		puts "Finished cooking pastas."
	end

	def mix_salads
		puts "Mixing salads."

		source_path = Rails.root.join('db', 'seeds_data', 'Salads.csv')
		contents = CSV.open source_path, headers: true, header_converters: :symbol
		
		contents.each do |row|
		  Salad.create row.to_hash
		end

		puts "Finished mixing salads."
	end

	load_data
