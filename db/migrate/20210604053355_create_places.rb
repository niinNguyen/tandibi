class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.string :locale, null: false
      t.string :coordinate, null: false
      t.string :name
      t.string :place_type

      t.timestamps
    end

    add_index :places, :locale
    add_index :places, :coordinate
    add_index :places, %i[locale coordinate], unique: true
  end
end
