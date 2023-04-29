Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:xxx", { :controller => "users", :action => ""})
end
