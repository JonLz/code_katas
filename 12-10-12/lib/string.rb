class StringCalculator
	def add(str)
		return nil unless str.instance_of? String
		str = clean(str)
		return nil unless str.scan(/,,/).empty?
		return 0 if str.split(',').length < 2
		str
		  .split(',')
		  .map { |num| num.to_i }
		  .reduce(:+)
	end

	def clean(str)
		str.gsub!(/\s/,',') || str
	end
end