class ApplicationController < ActionController::Base
    # CELLL

    helper_method :current_trainer, :logged_in?

    def current_trainer 
        @current_trainer ||= Trainer.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_trainer
    end

    def login(trainer)
        session[:session_token] = trainer.reset_session_token!
    end

    def logout
        current_trainer.reset_session_token! if logged_in?
        session[:session_token] = nil 
        redirect_to new_session_url
    end

    # ENSURRE

    def require_logged_in
        redirect_to new_session_url unless logged_in?
    end

    def require_logged_out
        redirect_to users_url if logged_in?
    end
end
