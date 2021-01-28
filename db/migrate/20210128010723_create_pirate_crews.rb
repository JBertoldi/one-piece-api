class CreatePirateCrews < ActiveRecord::Migration[6.0]
  def change
    create_table :pirate_crews do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
