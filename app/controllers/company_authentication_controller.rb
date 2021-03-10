class CompanyAuthenticationController < ApplicationController
  # Uncomment this if you want to force companies to sign in before any other actions
  skip_before_action(:force_sign_in, { :only => [:sign_up_form, :create, :sign_in_form, :create_cookie] })

  def sign_in_form
    render({ :template => "company_authentication/sign_in.html.erb" })
  end

  def create_cookie
    company = Company.where({ :email => params.fetch("query_email") }).first
    
    the_supplied_password = params.fetch("query_password")
    
    if company != nil
      are_they_legit = company.authenticate(the_supplied_password)
    
      if are_they_legit == false
        redirect_to("/company_sign_in", { :alert => "Incorrect password." })
      else
        session[:company_id] = company.id
      
        redirect_to("/", { :notice => "Signed in successfully." })
      end
    else
      redirect_to("/company_sign_in", { :alert => "No company with that email address." })
    end
  end

  def destroy_cookies
    reset_session

    redirect_to("/", { :notice => "Signed out successfully." })
  end

  def sign_up_form
    render({ :template => "company_authentication/sign_up.html.erb" })
  end

  def create
    @company = Company.new
    @company.email = params.fetch("query_email")
    @company.password = params.fetch("query_password")
    @company.password_confirmation = params.fetch("query_password_confirmation")
    @company.name = params.fetch("query_name")
    @company.logo = params.fetch("query_logo")
    @company.number_of_employees = params.fetch("query_number_of_employees")
    @company.hq_location = params.fetch("query_hq_location")

    save_status = @company.save

    if save_status == true
      session[:company_id] = @company.id
   
      redirect_to("/", { :notice => "Company account created successfully."})
    else
      redirect_to("/company_sign_up", { :alert => "Company account failed to create successfully."})
    end
  end
    
  def edit_profile_form
    render({ :template => "company_authentication/edit_profile.html.erb" })
  end

  def update
    @company = @current_company
    @company.email = params.fetch("query_email")
    @company.password = params.fetch("query_password")
    @company.password_confirmation = params.fetch("query_password_confirmation")
    @company.name = params.fetch("query_name")
    @company.logo = params.fetch("query_logo")
    @company.number_of_employees = params.fetch("query_number_of_employees")
    @company.hq_location = params.fetch("query_hq_location")
    
    if @company.valid?
      @company.save

      redirect_to("/", { :notice => "Company account updated successfully."})
    else
      render({ :template => "company_authentication/edit_profile_with_errors.html.erb" })
    end
  end

  def destroy
    @current_company.destroy
    reset_session
    
    redirect_to("/", { :notice => "Company account cancelled" })
  end
 
end
