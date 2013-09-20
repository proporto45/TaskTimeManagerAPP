# This conroller handles signing in and signing out
# See the devise gem for more information
class SessionsController < Devise::SessionsController
  
  # Of course, skip authorization for this class, since we DO authorization here
  # (it's cancan stuff, so if you don't use cancan, remove this line)
  skip_authorize_resource
  
  # The action for login
  # If format is html => render login form
  # If format is json => Say that something went wrong
  def new
    respond_to do |format|
      format.html { super }
      format.json {render :json => {:success => false, :errors => {:message => I18n.t('session.sign_in.failed.message'),
                                                                   :reason => I18n.t('session.sign_in.failed.wrong_password')}}}
    end
  end
  
  # Try to authorize a user
  # If it fails => redirect to #new
  def create
    respond_to do |format|  
      format.html { super }
      format.json {  
        warden.authenticate!(:scope => resource_name, :recall => "#{controller_path}#new")
        render :status => 200, :json => {:success => true, :redirect_to => session[:user_return_to] || after_sign_in_path_for(:user)}  
      }  
    end
  end
  
  # Define the default path after signing in
  # 
  # @param [Object, Symbol] resource_or_scope
  def after_sign_in_path_for(resource_or_scope)
    home_path
  end
  
  # Define the default path after signing out
  #
  # @param [Object, Symbol] resource_or_scope
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end