class Cocktails
	def mix(*drinks)
		if block_given?
			yield(drinks)
		else
			puts "Mixing: #{drinks.join(' + ')}"
		end
	end

	def method_missing(*args, &block)
		method_name = args.shift
		drinks = method_name.id2name.split(/and/i).collect { |drink| drink.downcase}
		self.send :mix, drinks, &block
	end
end

c = Cocktails.new
# c.mix("Gin", "Tonic") { |drinks| puts "Incredible mix of #{drinks.join(' + ')}!!!"}
c.ginAndTonic do |drinks| puts constants end