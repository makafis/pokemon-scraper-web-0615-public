require 'nokogiri'
require 'pry'

   html = File.read('pokemon_index.html')
  pokemon = Nokogiri::HTML(html)

  pokemons = {}


  pokemon.css("span.infocard-tall").each do |project|
      name = project.css("a.ent-name").text
       pokemons[name] = {
        :link => project.css("a.pkg").attribute("href").value,
        :type => project.css("small.aside").text

        } 
        binding.pry
  end