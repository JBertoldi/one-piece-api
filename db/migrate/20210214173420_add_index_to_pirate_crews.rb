class AddIndexToPirateCrews < ActiveRecord::Migration[6.0]
  def change
    add_index :pirate_crews, :name, unique: true
  end
end
