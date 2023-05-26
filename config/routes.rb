Rails.application.routes.draw do

  get("/", {:controller => "skills", :action => "index"})

  get("/my_skills", {:controller => "skills", :action => "my_skills"})

  # Routes for the Like resource:

  # CREATE
  post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  get("/likes", { :controller => "likes", :action => "index" })
  
  get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  
  post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # DELETE
  get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the Lesson resource:

  # CREATE
  post("/insert_lesson", { :controller => "lessons", :action => "create" })
          
  # READ
  get("/lessons", { :controller => "lessons", :action => "index" })
  
  get("/lessons/:path_id", { :controller => "lessons", :action => "show" })
  
  # UPDATE
  
  post("/modify_lesson/:path_id", { :controller => "lessons", :action => "update" })
  
  # DELETE
  get("/delete_lesson/:path_id", { :controller => "lessons", :action => "destroy" })

  #------------------------------

  # Routes for the Skill resource:

  # CREATE
  post("/insert_skill", { :controller => "skills", :action => "create" })
          
  # READ
  get("/skills", { :controller => "skills", :action => "index" })
  
  get("/skills/:path_id", { :controller => "skills", :action => "show" })
  
  # UPDATE
  
  post("/modify_skill/:path_id", { :controller => "skills", :action => "update" })
  
  # DELETE
  get("/delete_skill/:path_id", { :controller => "skills", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
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
