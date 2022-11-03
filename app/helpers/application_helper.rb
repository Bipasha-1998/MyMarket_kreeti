module ApplicationHelper

    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        !!current_user
    end


    def is_admin?
        current_user.try(:admin?)
    end
end
