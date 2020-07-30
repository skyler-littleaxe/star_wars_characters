require 'json'
require 'pry'
require 'open-uri'
require 'erb'
module StarWarsCharacters
    class API
    

        def self.search_characters(query)
            query_f = ERB::Util.url_encode("#{query}")
            url = "https://swapi.dev/api/people/?search=#{query_f}"
            req = URI.open(url)
            response_body = req.read
            json = JSON.parse(response_body)
        end
    
   
        def self.get_characters(query)
            data = self.search_characters(query)
            data["results"] 
        end
        
    end
end