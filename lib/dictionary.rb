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
      hash = {self.def => self.name}
      @@words_by_def.merge!(hash)
    end

    def self.clear
      @@words_by_def = {}
    end

    def self.search(def_str)
      @@words_by_def.fetch(def_str)
    end

    def self.delete(word_name)
      # reject returns the hash after the word name has been eliminated, and we set @@words_by_def to that new value
      @@words_by_def = @@words_by_def.reject{|k,v| v == word_name}
    end

  end

  class Definition
    @@def_by_word = {}

  end

end
