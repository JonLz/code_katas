require 'singleton'  

class StrCalc
	include Singleton

	def self.add(str)
		return nil unless str.kind_of? String
		delim = get_delim(str)
		nums = str.scan(/\d+#{Regexp.quote(delim)}?/).map { |x| x.sub(',','') }
		return 0 if nums.length < 2
		#return "negatives not allowed" unless nums.reject { |x| x.to_i > 0 }.empty?
		nums.map { |i| i.to_i }.reduce(:+)
	end

	def self.get_delim(str)
		"," || str.scan(/\/\/(.)\n/).flatten[0]
	end
end