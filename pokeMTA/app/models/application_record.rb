class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  helper_method :current_trainer, :logged_in?

  def current_trainer
    @current_trainer || Trainer.find_by(session_token: session[:session_token])
  end

  def ensure_logged_in
    if !logged_in?
      redirect_to new_session_url
    end
  end

  def login(trainer)
    @current_trainer = trainer 
    session[:session_token] = trainer.reset_session_token!
  end

  def logout
    current_trainer.reset_session_token!
    session[:session_token] = nil
    @trainer = nil 
  end

  def logged_in?
    !!current_trainer
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end

  def require_logged_out
    redirect_to trainers_url if logged_in?
  end
end
