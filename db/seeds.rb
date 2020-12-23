require 'poke-api-v2'

Pokemon.destroy_all

pokedex = PokeApi.get(pokedex: 6).pokemon_entries

pokedex.each do |poke|
    name = poke.pokemon_species.name
    new_url = poke.pokemon_species.url

    new_url.slice!("-species")
    resp = HTTParty.get(new_url)

    types = resp["types"]
    if types.length == 2
        type_1 = types[0]["type"]["name"]
        type_2 = types[1]["type"]["name"]
    else
        type_1 = types[0]["type"]["name"]
        type_2 = nil
    end

    sprite = resp["sprites"]["versions"]["generation-iv"]["platinum"]["front_default"]

    Pokemon.create(name: name, type_1: type_1, type_2: type_2, sprite: sprite)
end