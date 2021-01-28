class CreateCharacters < ActiveRecord::Migration[6.0]
  def change
    create_table :characters do |t|
      t.string :jp_name, null: false
      t.string :en_name, null: false
      t.string :epithet
      t.integer :bounty
      t.string :status, default: 'alive'
      t.references :devil_fruit, null: false, foreign_key: true
      t.references :pirate_crew, null: false, foreign_key: true

      t.timestamps
    end
  end
end
