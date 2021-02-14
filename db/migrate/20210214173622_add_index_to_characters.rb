class AddIndexToCharacters < ActiveRecord::Migration[6.0]
  def change
    add_index :characters, :en_name, unique: true
    add_index :characters, :jp_name, unique: true
    add_index :characters, :epithet, unique: true
  end
end
