class AddOrderToBookmark < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarks, :order, :integer
  end
end
