class WorkoutsController < ApplicationController
    before_action :set_workout, only: [:show, :edit, :update, :destroy]
    before_action :authentication_required

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
<<<<<<< HEAD
<<<<<<< HEAD
=======
<<<<<<< HEAD
        # byebug
=======
>>>>>>> 708b6b0a372f92ccd5832091c7802c9cf8dc7ebe
>>>>>>> msalerno93-master
=======
        # byebug
=======
>>>>>>> 708b6b0a372f92ccd5832091c7802c9cf8dc7ebe
>>>>>>> msalerno93-master
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

    #strong params

    def workout_params
        params.require(:workout).permit(:title, :muscle)
    end

end
