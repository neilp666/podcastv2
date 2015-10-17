class AddUserIdToPodcasts < ActiveRecord::Migration
  def change
    add_column :podcasts, :user_id, :integer
    add_index :podcasts, :user_id
  end
end
