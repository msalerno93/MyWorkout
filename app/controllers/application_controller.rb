class ApplicationController < ActionController::Base

    include ApplicationHelper::SessionsHelper

    before_action :current_user
end
