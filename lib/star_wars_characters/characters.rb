  require 'pry'
  module StarWarsCharacters
    class Character
      attr_accessor :name, :height, :mass, :hair_color, :eye_color, :birth_year, :gender
  
      @@all = []
  
      def initialize(attributes)
        @name = attributes["name"]
        @height = attributes["height"]
        @mass = attributes["mass"]
        @hair_color = attributes["hair_color"]
        @eye_color = attributes["eye_color"]
        @birth_year = attributes["birth_year"]
        @gender = attributes["gender"]
      end
  
      def self.get_stats(name)
        query_result = API.search_characters(name)
        # binding.pry
        @@all << self.create_from_results(query_result)
    end
    
    
    def self.create_from_results(results)
        self.new(results)
    end
  
    binding.pry
    
      def self.clear
        @@all.clear
      end
  
      def self.all
        @@all
      end
    end
  end