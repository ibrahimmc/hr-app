class ApplicationController < ActionController::Base
  before_action(:load_current_seeker)
  before_action(:load_current_company)
  
  # Force sign in of one of the two types of users (seeker or company)
  before_action(:force_sign_in)

  def force_sign_in
    if @current_seeker == nil && @current_company == nil 
      redirect_to("/", { :notice => "You have to sign in first." })
    end
  end
  
  def load_current_seeker
    the_id = session[:seeker_id]
    @current_seeker = Seeker.where({ :id => the_id }).first
  end
  
  def load_current_company
    the_id = session[:company_id]
    @current_company = Company.where({ :id => the_id }).first
  end

end
