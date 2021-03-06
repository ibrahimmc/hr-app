class ApplicationController < ActionController::Base
  before_action(:load_current_seeker)
  before_action(:load_current_company)
  
  # Uncomment this if you want to force seekers to sign in before any other actions
  # before_action(:force_seeker_sign_in)
  
  def load_current_seeker
    the_id = session[:seeker_id]
    @current_seeker = Seeker.where({ :id => the_id }).first
  end
  
  def force_seeker_sign_in
    if @current_seeker == nil
      redirect_to("/seeker_sign_in", { :notice => "You have to sign in first." })
    end
  end

  
  
  # Uncomment this if you want to force companies to sign in before any other actions
  # before_action(:force_company_sign_in)
  
  def load_current_company
    the_id = session[:company_id]
    @current_company = Company.where({ :id => the_id }).first
  end
  
  def force_company_sign_in
    if @current_company == nil
      redirect_to("/company_sign_in", { :notice => "You have to sign in first." })
    end
  end

end
