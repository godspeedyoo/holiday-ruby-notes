class Dealership
	MAKES = ['honda','ford','toyota','nissan']

	attr_accessor :cars

	def method_missing(name, *args)
		make = name.to_s
		if MAKES.include?(make)
			self.class.class_eval do
				define_method(make) do
					find_by_make(make)
				end
			end
			send(make)
		else
			puts "#{make} does not exist in our inventory."
			super
		end
	end

	private

	def find_by_make(make)
		# puts "found"
		# found = []
		# found << 
		cars.select { |car| car.make == make }
		# found.each do |car| puts car.make end
	end

end

class Car
	attr_reader :make, :model, :year, :id
	
	def initialize(args = {})
		@make 		= args[:make]
		@model 		= args[:model]
		@year			= args[:year]
		@id 			= args[:id]
	end
end

my_dealership = Dealership.new
test = Car.new(make: 'honda', model: 'accord', year: 2014, id: 101)
test2 = Car.new(make: 'toyota', model: 'avalon', year: 2014, id: 102)

my_dealership.cars = [test, test2]


p my_dealership.honda
p my_dealership.toyota

# p test.make