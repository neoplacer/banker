class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :player_id
      t.integer :game_id
      t.string :player_name
      t.string :player_code
      t.boolean :banker
      t.integer :balance
      t.timestamps
    end
  end
end
