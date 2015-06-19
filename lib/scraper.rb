require 'nokogiri'
require 'pry'
class Scraper
  def initialize(db)
    @@db = db
    html = File.read('pokemon_index.html')
    @pokemon = Nokogiri::HTML(html)
  end


  def scrape
    @pokemons = {}
    @pokemon.css("span.infocard-tall").each do |project|
        @name = project.css("a.ent-name").text
        @pokemons[@name] = {
          :type => project.css("small.aside").text.split(" · ")
        } 
    end
    pokemon_class(@pokemons)
  end

    def pokemon_class(scraped_pokemon)
      scraped_pokemon.each do |k, v|  
      #k = name
      #v[:type] = [of the type]
      poke = Pokemon.new
      poke.name = k
      poke.type = v[:type].join(", ")
      Pokemon.save(poke.name, poke.type, @@db)
      
      end
    end




end
