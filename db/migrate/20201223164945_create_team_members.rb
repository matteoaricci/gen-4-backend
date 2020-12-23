class CreateTeamMembers < ActiveRecord::Migration[6.0]
  def change
    create_table :team_members do |t|
      t.integer :team_id
      t.integer :pokemon_id
      t.timestamps
    end
  end
end
