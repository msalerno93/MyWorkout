class CommentsController < ApplicationController
    before_action :set_workout
    before_action :set_comment, only: [:edit, :update, :destroy]

    def new
        @comment = Comment.new
    end

    def create
        @comment = @workout.comments.build(text: comment_params[:text], user: @current_user)
        if @comment.save
            redirect_to user_workout_path(@current_user, @workout)
        else
            @errors = @comment.errors.full_messages
            render :new
        end
    end

    def edit
    end

    def update
        if @comment.update(comment_params)
            redirect_to user_workout_path(@current_user, @workout)
        else
            @errors = @comment.errors.full_messages
            render :edit
        end
    end

    def destroy
        @comment.destroy
        redirect_to user_workout_path(@current_user, @workout)
    end



    private

        def set_workout
            @workout = Workout.find(params[:workout_id])
        end

        def set_comment
            @comment = Comment.find(params[:id])
        end

        def comment_params
            params.require(:comment).permit(:text)
        end

end
