module Dictionary

  class Word
    attr_accessor :name, :def
    attr_reader :id

    @@words_by_def = {}
    @@word_id_gen = 0

    def initialize(attr)
      @@word_id_gen +=1
      @name = attr.fetch(:name)
      @def = attr.fetch(:def)
      # @id = attr.fetch(:id)
    end

    def self.all
      @@words_by_def
    end

    def save
      hash = {self.name => self.def}
      @@words_by_def.merge!(hash)
    end

    def self.clear
      @@words_by_def = {}
    end

  end

  class Definition
    @@def_by_word = {}

  end

end
