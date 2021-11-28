class CommentsController < ApplicationController
    before_action :set_workout

    def index
    end

    def new
        @comment = Comment.new
    end

    def create
        @comment = @workout.comments.build(text: comment_params[:text], user: @current_user)
        if @comment.save
            redirect_to user_workout_path(@current_user, @workout)
        else
            # redirect_to new_user_workout_comment_path(@current_user, @workout)
            @errors = @comment.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def show
    end

    def destroy
    end



    private

        def set_workout
            @workout = Workout.find(params[:workout_id])
        end

        def comment_params
            params.require(:comment).permit(:text)
        end

end
