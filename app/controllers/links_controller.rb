class LinksController < ApplicationController
    def index
        @links = Link.recent_posts.load_async
        # It's used for when relation is iterated and bacground query is 
        #   not executed yet, then it will be performed by the foreground thread
    end

    def create
        @link = Link.new(link_params)
        if @link.save
            redirect_to root_path
        else
            index # This sets the @links instance variable again.
            render :index, status: :unprocessable_entity
        end
    end

    private
    def link_params
        params.require(:link).permit(:url)
    end
end