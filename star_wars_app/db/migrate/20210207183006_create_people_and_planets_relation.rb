class CreatePeopleAndPlanetsRelation < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :planets
  end
end
