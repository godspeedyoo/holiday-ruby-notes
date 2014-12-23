module Somethingable
	def self.included(base)
		base.extend(ClassMethods)
	end

	module ClassMethods
		def bar
			puts "class method #{self.method}"
		end
	end

	def foo
		puts "instance method #{self.method}"
	end
end

class Test
	include Somethingable
end

a = Test.new
a.send(:foo)
