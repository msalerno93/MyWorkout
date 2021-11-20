module ApplicationHelper
    module SessionsHelper
        
        def logged_in?
            !!current_user
        end


        def current_user
            byebug
            if session[:current_user_id]
                @current_user ||= User.find(session[:current_user_id])
            end
        end

        def login(user)
            session[:current_user_id] = @user
        end
    end
end
