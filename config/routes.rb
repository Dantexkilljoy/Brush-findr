Rails.application.routes.draw do
  # Routes for the Program resource:

  # CREATE
  post("/insert_program", { :controller => "programs", :action => "create" })
          
  # READ
  get("/programs", { :controller => "programs", :action => "index" })
  
  get("/programs/:path_id", { :controller => "programs", :action => "show" })
  
  # UPDATE
  
  post("/modify_program/:path_id", { :controller => "programs", :action => "update" })
  
  # DELETE
  get("/delete_program/:path_id", { :controller => "programs", :action => "destroy" })

  #------------------------------

  get("/", { controller: "artstyles", action: "index" })

  # Routes for the Artstyle resource:

  # CREATE
  post("/insert_artstyle", { :controller => "artstyles", :action => "create" })

  # READ
  get("/artstyles", { :controller => "artstyles", :action => "index" })

  get("/artstyles/:path_id", { :controller => "artstyles", :action => "show" })

  # UPDATE

  post("/modify_artstyle/:path_id", { :controller => "artstyles", :action => "update" })

  # DELETE
  get("/delete_artstyle/:path_id", { :controller => "artstyles", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create" })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------

end
