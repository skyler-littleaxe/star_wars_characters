require 'json'
require 'pry'
require 'open-uri'
require 'erb'
module StarWarsCharacters
  class API
    API_HOST = "https://swapi.dev/api/"
    CHARACTERS = "/people/"


    #KEY NOT NEEDED FOR API

    # def self.api_public_key 
    #   begin
    #     @@public = File.open(File.expand_path("~/")).read.strip
    #   rescue 
    #     puts "No public key found. Please follow the instructions at to get your keys."

    #     # create public key
    #     puts "Please enter your public key:"
    #     @@public = gets.strip 
    #     return if @@public == "exit"
    #     File.open(File.expand_path("~/"), "w") do |file|
    #       file.print @@public
    #     end
    #   end
    #   @@public
    # end

    def self.search_by_query(query)
      
      url = "https://swapi.dev/api/people/"
      req = URI.open(url)
      response_body = req.read
      json = JSON.parse(response_body)
      # puts JSON.pretty_generate(json)
    end
   

    def self.search_characters(query)
      results = self.search_by_query(query)
      results["results"][0]
    end
   
  end
end