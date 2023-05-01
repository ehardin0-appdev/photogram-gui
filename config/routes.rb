Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_username", { :controller => "users", :action => "show"})

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_id", { :controller => "photos", :action => "show" })

  get("/delete_photo/:toast_id", { :controller => "photos", :action => "delete" })

  get("/insert_photo", { :controller => "photos", :action => "create" } )

  get("/update_photo/:modify_id", { :controller => "photos", :action=> "update" })

  get("/add_user", { :controller => "users", :action => "add" })

  get("/edit_user/:user_id", { :controller => "users", :action => "edit" })

  get("/add_comment", { :controller => "photos", :action => "comment" })
end
