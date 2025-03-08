class ApplicationController < ActionController::Base
    protected
  
    # Redirect to login page after signing up
    def after_sign_up_path_for(resource)
        new_user_registration
    end
  
    # Redirect to login page after signing out
    def after_sign_out_path_for(resource_or_scope)
      new_user_session_path
    end
  
    # Redirect to home page after successful login
    def after_sign_in_path_for(resource)
      root_path
    end
  end
  