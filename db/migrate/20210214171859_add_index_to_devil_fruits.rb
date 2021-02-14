class AddIndexToDevilFruits < ActiveRecord::Migration[6.0]
  def change
    add_index :devil_fruits, :name, unique: true
  end
end
