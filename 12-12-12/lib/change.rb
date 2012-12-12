# Refactor #1
class Changer
	def self.make_change(cents)
    change = Array.new
    coin = 1 if cents >= 1
    coin = 5 if cents >= 5
    coin = 10 if cents >= 10
    coin = 25 if cents >= 25
    return [] if cents == 0
    change << coin << Changer.make_change(cents-coin)
    change.flatten
  end
end
	
# Base implementation
=begin
class Changer
	def self.make_change(cents)
    change = Array.new
    if cents >= 25 
    	change << 25
    	change << Changer.make_change(cents-25)
    elsif cents >= 10
    	change << 10
    	change << Changer.make_change(cents-10)
    elsif cents >= 5
    	change << 5
    	change << Changer.make_change(cents-5)
    elsif cents >= 1
    	change << 1
    	change << Changer.make_change(cents-1)
    elsif cents == 0
    	change.flatten
    end
    change.flatten
  end
end
=end