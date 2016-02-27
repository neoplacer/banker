class ModifyGamesOwnerColumn < ActiveRecord::Migration
  def change
    rename_column :games, :owner, :user_id
    change_column :games, :user_id, :integer
  end
end
