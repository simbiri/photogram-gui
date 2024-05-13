Rails.application.routes.draw do
  get("/", :controller => "users", :action => "index" )

  get("/users", {:controller => "users" , :action=>"index"})
  get("/users/:user_name", {:controller => "users", :action => "user_details"})

  get("/photos", {:controller => "photos" , :action => "index"})
  get("/photos/:photo_id", {:controller => "photos", :action =>"photo_details"})
  get("/delete_photo/:photo_id", {:controller => "photos", :action => "delete"})


end
