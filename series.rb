
class Series
  attr_reader :series
  
def initialize(slice_string)
  
  @series = slice_string.split('').map(&:to_i)

end

def slices(size)
  # we can also use Enumerable#each_cons
  raise ArgumentError,"slice bigger than size of string!!" if size > series.length
  total_slices = series.length - size 
  (0..total_slices).map do |position|
   series.slice(position, size)
  end
  
end

end



