Rails.application.routes.draw do

  # Home
  get("/", { :controller => "jobs", :action => "index" })

  # Routes for the Seeker account:

  # SIGN UP FORM
  get("/seeker_sign_up", { :controller => "seeker_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_seeker", { :controller => "seeker_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_seeker_profile", { :controller => "seeker_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_seeker", { :controller => "seeker_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_seeker_account", { :controller => "seeker_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/seeker_sign_in", { :controller => "seeker_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/seeker_verify_credentials", { :controller => "seeker_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/seeker_sign_out", { :controller => "seeker_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Bid resource:

  # CREATE
  post("/insert_bid", { :controller => "bids", :action => "create" })
          
  # READ
  get("/bids", { :controller => "bids", :action => "index" })
  
  get("/bids/:path_id", { :controller => "bids", :action => "show" })
  
  # UPDATE
  
  post("/modify_bid/:path_id", { :controller => "bids", :action => "update" })
  
  # DELETE
  get("/delete_bid/:path_id", { :controller => "bids", :action => "destroy" })

  #------------------------------

  # Routes for the Company account:

  # SIGN UP FORM
  get("/company_sign_up", { :controller => "company_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_company", { :controller => "company_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_company_profile", { :controller => "company_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_company", { :controller => "company_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_company_account", { :controller => "company_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/company_sign_in", { :controller => "company_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/company_verify_credentials", { :controller => "company_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/company_sign_out", { :controller => "company_authentication", :action => "destroy_cookies" })
             
  #------------------------------

  # Routes for the Job resource:

  # CREATE
  post("/insert_job", { :controller => "jobs", :action => "create" })
          
  # READ
  get("/jobs", { :controller => "jobs", :action => "index" })
  
  get("/jobs/:path_id", { :controller => "jobs", :action => "show" })
  
  # UPDATE
  
  post("/modify_job/:path_id", { :controller => "jobs", :action => "update" })
  
  # DELETE
  get("/delete_job/:path_id", { :controller => "jobs", :action => "destroy" })

  #------------------------------

end
