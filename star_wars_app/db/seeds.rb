# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'rest-client'
require 'json'

#get people
response = RestClient.get('http://swapi.dev/api/people/')

people = JSON.parse(response.body)['results']
index_person = 0
person = people[index_person]
while person != nil do
    #create or find person
    p = Person.find_or_create_by(name: person['name'], mass: person['mass'], birthyear: person['birth_year'])
    #get species
    index_species = 0
    species = person['species'][index_species]
    while species != nil do
        sp = JSON.parse(RestClient.get(person['species'][index_species]))
        s = Species.find_or_create_by(name: sp['name'])
        p.species << s
        index_species = index_species + 1
        species = person['species'][index_species]
    end
    #get starships
    index_starships = 0
    starships = person['starships'][index_starships]
    while starships != nil do
        sp = JSON.parse(RestClient.get(starships))
        s = Starship.find_or_create_by(name: sp['name'])
        p.starships << s
        index_starships = index_starships + 1
        starships = person['starships'][index_starships]
    end
    #get planet
    planet_url = person['homeworld']
    pl = JSON.parse(RestClient.get(planet_url))
    planet = Planet.find_or_create_by(name: pl['name'])
    if p.planets.empty?
        p.planets << planet
    end

    #log
    puts "person created: " + Person.find(p.id).name

    #change index
    index_person = index_person + 1
    person = people[index_person]
end