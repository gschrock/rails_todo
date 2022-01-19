class ApplicationController < ActionController::Base
  def authenticate
    redirect_to new_session_path unless signed_in?
  end

  # NOTE: alternate syntax
  # def authenticate
  #   if !signed_in?
  #     redirect_to new_session_path
  #   end
  # end

  def signed_in?
    session[:current_email].present?
  end
end
