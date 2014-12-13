class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.boolean :turn
      t.date :year

      t.timestamps
    end
  end
end
