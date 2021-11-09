class WorkoutsController < ApplicationController
    before_action :set_workout, only: [:show, :edit, :update, :destroy]

    def index
        @workouts = Workout.all
    end

    def show
    end
  
    def new
        #allows to create object so form_for knows about properties(attributes) that belong to object
        #because this is created - form_for knows about title and muscle
        @workout = Workout.new
    end
  
    def create
        @workout = Workout.new(workout_params)
        if @workout.save
            redirect_to workouts_path
        else
            @errors = @workout.errors.full_messages
            render :new
        end
    end
  
    def edit
    end
  
    def update
        if @workout.update(workout_params)
            redirect_to workouts_path
        else
            @error = @workout.errors.full_messages
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

    #strong params

    def workout_params
        params.require(:workout).permit(:title, :muscle)
    end

end
