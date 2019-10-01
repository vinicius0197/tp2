class CircularShift
  attr_accessor :kwic_dict

  def initialize(lines)
    @lines = lines
    @kwic_dict = {}
    @stopwords = [
      'In', 'is', 'an', 'the', 'The', 'for'
    ]
  end

  def create_kwic_dict
    kwic_dict = {}
    
    @lines.each do |line|
      words = line.split(/\W+/)
      words.each do |word|
        unless @stopwords.include? word
          if(kwic_dict[word])
            kwic_dict[word.downcase].push(line)
          else
            kwic_dict[word.downcase] = [line]
          end
        end
      end
    end

    @kwic_dict = kwic_dict
    return kwic_dict
  end

  def order
    @kwic_dict = @kwic_dict.sort.to_h
  end
end