# This class handles the user based crud actions for the Bookmarks Object.
class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
    @movie = Movie.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    # @movie = Movie.find(params[:bookmark][:movie_id])
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    # @bookmark.movie = @movie
    if @bookmark.save
      redirect_to list_path(@list), notice: 'Bookmark was successfully created'
    else
      render :new
    end
  end

  def destroy
    @list = List.find(params[:id])
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@list), notice: 'Bookmark was successfully deleted'
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
