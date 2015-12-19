class PigLatin
  CONSONANTS = ['ch','qu','th','squ','thr','sch','y','p','k','x','f','r']
  IRREGULARS = ['yt','xr']
  def self.translate(phrase)
    all_words = phrase.split
    all_words.map do |word|
      letters = word.split('')
      if CONSONANTS.include?(word.slice(0,3))
        pig = letters.shift(3)
        (letters + pig + ["ay"]).join
      elsif CONSONANTS.include?(word.slice(0,2))
        pig = letters.shift(2)
        (letters + pig + ["ay"]).join
      elsif CONSONANTS.include?(word.slice(0,1))
        if IRREGULARS.include?(word.slice(0,2)) 
          word.concat('ay')
        else
          pig = letters.shift(1)
          (letters + pig + ['ay']).join
        end
    
      else
        word.concat("ay")
      end
    end.join(' ')
  end
end
  



