class Person < ApplicationRecord
  has_and_belongs_to_many :species
  has_and_belongs_to_many :planets
  has_and_belongs_to_many :starships

  validates :name, presence: true, uniqueness: true

  def get_species
    species = ""
    if self.species != nil
      self.species.each do |s|
        species = species + s.name + " "
      end
    end
    species
  end

  
  def get_starships
    starships = ""
    if self.starships != nil
      self.starships.each do |s|
        starships = starships + s.name + " "
      end
    end
    starships
  end
end
