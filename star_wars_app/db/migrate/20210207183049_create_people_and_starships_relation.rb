class CreatePeopleAndStarshipsRelation < ActiveRecord::Migration[6.1]
  def change
    create_join_table :people, :starships
  end
end
