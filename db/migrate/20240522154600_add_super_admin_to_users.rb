class AddSuperAdminToUsers < ActiveRecord::Migration[7.0]
  def change
    User.find(1).update(super_admin: true) if User.exists?(1)
  end
end
