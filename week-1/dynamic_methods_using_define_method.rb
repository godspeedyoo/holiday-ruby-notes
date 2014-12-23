class Tweet
	states = [:draft, :posted, :deleted]
	states.each do |status|
		define_method status do
			@status = status
		end
	end
end


