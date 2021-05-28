class AddBookmarkToList < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookmarks, :list, index: true
    add_foreign_key :bookmarks, :lists
  end
end
