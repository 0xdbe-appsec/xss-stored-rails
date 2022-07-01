class BookmarksController < ApplicationController

    def bookmark_params
        params.require(:bookmark).permit(:title, :link, :color, :comment)
    end

    def create
        @Bookmark = Bookmark.new(bookmark_params)
        @Bookmark.save
        redirect_to @Bookmark
    end

    def edit
        @Bookmark = Bookmark.find(params[:id])
    end

    def index
        @Bookmarks = Bookmark.all
    end

    def new
      @Bookmark = Bookmark.new
    end

    def show
        @Bookmark = Bookmark.find(params[:id])
    end
    
    def update
        @Bookmark = Bookmark.find(params[:id])
        @Bookmark.update(bookmark_params)
        redirect_to @Bookmark
    end   
end
