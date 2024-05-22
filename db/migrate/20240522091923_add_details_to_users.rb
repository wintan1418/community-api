class AddDetailsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :alopecia_discovered_at, :date
    add_column :users, :alopecia_extent, :integer
    add_column :users, :location, :string
  end
end
