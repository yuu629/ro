class AddColumsToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :about, :text
    add_column :users, :status, :boolean, default: false
  end
end
