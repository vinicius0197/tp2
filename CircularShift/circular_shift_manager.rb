class CircularShift
  attr_accessor :kwic_dict, :stopwords

  # input = Objeto do tipo InputManager, que deve possuir um atributo chamado 'title_list', que é uma lista
  # contendo os títulos dos artigos
  def initialize(input)
    @lines = input.title_list
    @kwic_dict = {}
    @stopwords = []

    get_stopwords()
  end

  # Usa o atributo '@lines' para criar um dicionário KWIC, levando em conta as stopwords
  def create_kwic_dict
    kwic_dict = {}
    
    @lines.each do |line|
      words = line.split(/\W+/)
      words.each do |word|
        unless @stopwords.include? "#{word}\n"
          if(kwic_dict[word])
            kwic_dict[word.downcase].push(line)
          else
            kwic_dict[word.downcase] = [line]
          end
        end
      end
    end

    @kwic_dict = kwic_dict
  end

  # Realiza ordenamento alfabético do atributo @kwic_dict
  def order
    @kwic_dict = @kwic_dict.sort.to_h
  end

  private

  def get_stopwords
    text = File.open('./stopwords.txt').read
    text.gsub!(/\r\n?/, "\n")
    text.each_line do |line|
      @stopwords.push(line)
    end
  end
end