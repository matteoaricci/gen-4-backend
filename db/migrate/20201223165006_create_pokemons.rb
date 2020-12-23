class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :type_1
      t.string :type_2, :default => nil
      t.string :sprite
      t.timestamps
    end
  end
end
