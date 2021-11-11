class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def index
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks
  end

  def create
    @list = List.find(params[:id])
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list)
    else
      p 'I didnt save!!!!!!!!!!!!!!!!!!!!!!!!!'
      p @bookmark.errors.messages
      p
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
