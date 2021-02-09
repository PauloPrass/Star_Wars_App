class CreateStarships < ActiveRecord::Migration[6.1]
  def change
    create_table :starships do |t|
      t.string :name

      t.timestamps
    end
  end
end
