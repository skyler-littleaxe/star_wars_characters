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
           @@all = API.get_characters(name).map do |character|
            self.new(character)
           end
        end
        
        def self.clear
            @@all.clear
        end
    
        def self.all
            @@all
        end
        
    end
end