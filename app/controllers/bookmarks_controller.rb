class BookmarksController < ApplicationController
  before_action :set_list, except: [:destroy]

  def new
    @bookmark = Bookmark.new
  end

  def create
    # raise
    @bookmark = Bookmark.new(bookmark_params)
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path, status: :see_other
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:movie, :comment)
  end
end
