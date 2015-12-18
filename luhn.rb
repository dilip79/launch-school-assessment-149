class Luhn
  
  def initialize(number)
    @number = number
  end
  
  def addends
    a = @number.to_s.scan(/./).map{|x| x.to_i}.reverse
    
    a.each_with_index.map do|val,idx| 
      if idx.odd?
        a[idx]*2 >= 10 ? a[idx]*2 - 9 : a[idx]*2
      else
        a[idx]
      end
    end.reverse
    
  end
  
  def checksum
    addends.reduce(:+)
    
  end
  def valid?
    checksum % 10 == 0
    
  end
  
  def self.create(num)
    check_num = num * 10
    luhnify = Luhn.new(check_num)
    luhnify.valid? ? check_num : check_num + (10- luhnify.checksum % 10)
    
  end
  
end



