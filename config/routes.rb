Rails.application.routes.draw do
  # get("/", { :controller => "places", :action => "index" })
  # forced to login first
   get("/", {:controller => "sessions", :action => "new"})
  resources "entries"
  resources "places"

  resources "sessions"
    get("/login", {:controller => "sessions", :action => "new"})
    get("/logout", {:controller => "sessions", :action => "destroy"})
    
  resources "users"
end
