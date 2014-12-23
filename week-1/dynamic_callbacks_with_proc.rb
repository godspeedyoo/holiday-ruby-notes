class Proc
  def callback(callable, *args)
    self === Class.new do
      method_name = callable.to_sym
      define_method(method_name) { |&block| block.nil? ? true : block.call(*args) }
      define_method("#{method_name}?") { true }
      def method_missing(method_name, *args, &block) false; end
    end.new
  end
end


def tweet(message, &block)
	block.callback :success
rescue => e
	block.callback :failure, e.message
end

tweet "testing this tweet" do |on|
	on.success do
		puts "Tweet successful!"
	end
	on.failure do |status|
		puts "Error: #{status}"
	end
end

tweet("hello") { |tweet| puts tweet }