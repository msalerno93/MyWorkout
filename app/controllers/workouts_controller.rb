class WorkoutsController < ApplicationController
    before_action :set_workout, only: [:show, :edit, :update, :destroy]
    before_action :authentication_required


    def index
        @workouts = Workout.alpha
    end

    def show
    end
  
    def new
        @workout = Workout.new
    end
  
    def create
        @workout = current_user.workouts.build(workout_params)
        if @workout.save
            redirect_to workouts_path
        else
            @errors = @workout.errors.full_messages
            render :new
        end
    end
  
    def update
        if @workout.update(workout_params)
            redirect_to workouts_path
        else
            @errors = @workout.errors.full_messages
            render :edit
        end
    end
  
    def destroy
        @workout.destroy
        redirect_to workouts_path
    end

    private

    def set_workout
        @workout = Workout.find_by_id(params[:id])
    end

    def workout_params
        params.require(:workout).permit(:title, :muscle)
    end

end
