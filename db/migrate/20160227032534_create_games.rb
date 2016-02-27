class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :entrycode
      t.string :owner
      t.string :gamename
      t.timestamps
    end
  end
end
