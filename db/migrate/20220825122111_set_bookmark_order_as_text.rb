class SetBookmarkOrderAsText < ActiveRecord::Migration[7.0]
  def change
    change_column(:bookmarks, :order, :text)
  end
end
