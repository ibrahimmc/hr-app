class SeekerAuthenticationController < ApplicationController
  # Uncomment this if you want to force seekers to sign in before any other actions
  skip_before_action(:force_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "seeker_authentication/sign_in.html.erb" })
  end

  def create_cookie
    seeker = Seeker.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if seeker != nil
      are_they_legit = seeker.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/seeker_sign_in", { :alert => "Incorrect password." })
      else
        session[:seeker_id] = seeker.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/seeker_sign_in", { :alert => "No seeker with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "seeker_authentication/sign_up.html.erb" })
  end

  def create
    @seeker = Seeker.new
    @seeker.email = params.fetch("query_email")
    @seeker.password = params.fetch("query_password")
    @seeker.password_confirmation = params.fetch("query_password_confirmation")
    @seeker.first_name = params.fetch("query_first_name")
    @seeker.last_name = params.fetch("query_last_name")
    @seeker.industry = params.fetch("query_industry")
    @seeker.years_of_exp = params.fetch("query_years_of_exp")
    @seeker.bid_points = 2000

    save_status = @seeker.save

    if save_status == true
      session[:seeker_id] = @seeker.id
   
      redirect_to("/", { :notice => "Seeker account created successfully."})
    else
      redirect_to("/seeker_sign_up", { :alert => "Seeker account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "seeker_authentication/edit_profile.html.erb" })
  end

  def update
    @seeker = @current_seeker
    @seeker.email = params.fetch("query_email")
    @seeker.password = params.fetch("query_password")
    @seeker.password_confirmation = params.fetch("query_password_confirmation")
    @seeker.first_name = params.fetch("query_first_name")
    @seeker.last_name = params.fetch("query_last_name")
    @seeker.industry = params.fetch("query_industry")
    @seeker.years_of_exp = params.fetch("query_years_of_exp")
    @seeker.bid_points = params.fetch("query_bid_points")
    
    if @seeker.valid?
      @seeker.save

      redirect_to("/", { :notice => "Seeker account updated successfully."})
    else
      render({ :template => "seeker_authentication/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_seeker.destroy
    reset_session
    
    redirect_to("/", { :notice => "Seeker account cancelled" })
  end
 
end
