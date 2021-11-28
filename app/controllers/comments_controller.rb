class CommentsController < ApplicationController
    

    def index
    end

    def new
        @comment = Comment.new
    end

    def create
    end

    def edit
    end

    def show
    end

    def destroy
    end



    private

        def comment_params
            params.require(:comment).permit(:text)
        end

end
