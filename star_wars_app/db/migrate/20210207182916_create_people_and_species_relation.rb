class CreatePeopleAndSpeciesRelation < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :species
  end
end
