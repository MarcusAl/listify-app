class AddBookmarkToMovie < ActiveRecord::Migration[6.0]
  def change
    add_reference :bookmarks, :movie, index: true
    add_foreign_key :bookmarks, :movies
  end
end
