Rails.application.routes.draw do
  get("/", :controller => "users", :action => "index")

  get("/users", { :controller => "users", :action => "index" })
  get("/users/:user_name", { :controller => "users", :action => "user_details" })
  post("/add_user", { :controller => "users", :action => "add_user" })
  post("/update_user/:user_id", { :controller => "users", :action => "update_user" })

  get("/photos", { :controller => "photos", :action => "index" })
  get("/photos/:photo_id", { :controller => "photos", :action => "photo_details" })
  get("/delete_photo/:photo_id", { :controller => "photos", :action => "delete" })
  post("/add_photo", {:controller => "photos", :action => "add_photo"})
  post("/update_photo/:photo_id", {:controller => "photos", :action => "update_photo"})
  post("/add_comment", {:controller => "photos" , :action => "add_comment"})

end
