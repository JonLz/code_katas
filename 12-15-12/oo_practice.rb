# OO Practice
# Define an address book
class AddressBook
	def initialize
  end

  def add_entry
  end

  def delete_entry
  end

  def update_entry
  end

  def view_entry
  end
end

class Person
  attr_accessor :name
  def initialize(name)
    @name=name
  end
end

class Address
  attr_accessor :address
  def intialize(address)
  end
end

class AddressEntry
  attr_accessor :person, :address
  def initialize(person, address)
    @person = person
    @address = address
  end
end



