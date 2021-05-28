# This class handles the user based crud actions for the Lists Object.
class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def bookmark
    @bookmark = List.bookmark
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @bookmark = Bookmark.new
    @list = List.new
  end

  def create
    @list = List.new(strong_params)
    if @list.save
      redirect_to list_path(@list), notice: 'List was successfully created'
    else
      render :new, notice: 'List creation was unsuccessful'
    end
  end

  private

  def strong_params
    params.require(:list).permit(:name)
  end
end
