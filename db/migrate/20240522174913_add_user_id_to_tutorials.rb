class AddUserIdToTutorials < ActiveRecord::Migration[7.0]
  def change
    add_column :tutorials, :user_id, :bigint
  end
end
