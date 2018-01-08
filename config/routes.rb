Competition::Application.routes.draw do

  get "competition/list"
  get "competition/show"
  get "competition/edit"

  root to: "competition#list" 
end
