require 'pry'
class Vendor
  attr_reader :name, :inventory, :agg
  def initialize(name)
    @name = name
    @inventory = Hash.new{0}
    @agg = []
  end

  def check_stock(item)
    @inventory[item]
  end

  def stock(item, quantity)
    @inventory["key"] = item
    @inventory[item] += quantity
    @inventory.delete("key")
  end

end
