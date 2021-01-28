class CreateDevilFruits < ActiveRecord::Migration[6.0]
  def change
    create_table :devil_fruits do |t|
      t.string :name, null: false
      t.string :power_type, null: false

      t.timestamps
    end
  end
end
