class RemoveUniqueIndexOnPirateCrewsName < ActiveRecord::Migration[6.0]
  def change
    remove_index :pirate_crews, :name
  end
end
