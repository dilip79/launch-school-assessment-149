class Octal
attr_accessor :items
  def initialize(str)
    @items = str.split('').any? {|key|key.match (/\D|[8-9]/) } ? [0] : str.split('').map(&:to_i).reverse
  end

  def to_decimal
    octal = items.each_with_index.map { |val,key| val*(8**key) }
    octal.inject(:+)
  end

end


