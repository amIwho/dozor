Dozor::Application.routes.draw do

  get "stat/:game_id" => "rgame#stat"

  post "task_orders/:taskorder_id" => 'task_orders#up'

  get "admin" => "admin#index"
  
  controller :sessions do
	get 'login' => :new
	post 'login' => :create
	delete 'logout' => :destroy
  end

  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"

  match 'task_orders/change_order' => 'task_orders#change_order'

  post '/rgame/post_answer' => 'rgame#post_answer'
  
  get '/games/end_game/:game_id' => 'games#end_game'
  get '/games/reuse_game/:game_id' => 'games#reuse_game'

  resources :task_orders do 
	collection do
		put :change_order
	end
  end

  resources :task_orders
  resources :teams
  resources :tryes
  resources :codes
  resources :games
  mount Ckeditor::Engine => '/ckeditor'
  resources :tasks

  root :to => 'rgame#index'

end
#== Route Map
# Generated on 21 May 2013 10:16
#
#                    admin GET    /admin(.:format)                     admin#index
#                    login GET    /login(.:format)                     sessions#new
#                          POST   /login(.:format)                     sessions#create
#                   logout DELETE /logout(.:format)                    sessions#destroy
#             sessions_new GET    /sessions/new(.:format)              sessions#new
#          sessions_create GET    /sessions/create(.:format)           sessions#create
#         sessions_destroy GET    /sessions/destroy(.:format)          sessions#destroy
# task_orders_change_order        /task_orders/change_order(.:format)  task_orders#change_order
#                                 /play/:game_id(.:format)             rgame#show_current_level
#                                 /games/end_game/:game_id(.:format)   games#end_game
#                                 /games/start_game/:game_id(.:format) games#start_game
#        rgame_post_answer POST   /rgame/post_answer(.:format)         rgame#post_answer
# change_order_task_orders PUT    /task_orders/change_order(.:format)  task_orders#change_order
#              task_orders GET    /task_orders(.:format)               task_orders#index
#                          POST   /task_orders(.:format)               task_orders#create
#           new_task_order GET    /task_orders/new(.:format)           task_orders#new
#          edit_task_order GET    /task_orders/:id/edit(.:format)      task_orders#edit
#               task_order GET    /task_orders/:id(.:format)           task_orders#show
#                          PUT    /task_orders/:id(.:format)           task_orders#update
#                          DELETE /task_orders/:id(.:format)           task_orders#destroy
#                          GET    /task_orders(.:format)               task_orders#index
#                          POST   /task_orders(.:format)               task_orders#create
#                          GET    /task_orders/new(.:format)           task_orders#new
#                          GET    /task_orders/:id/edit(.:format)      task_orders#edit
#                          GET    /task_orders/:id(.:format)           task_orders#show
#                          PUT    /task_orders/:id(.:format)           task_orders#update
#                          DELETE /task_orders/:id(.:format)           task_orders#destroy
#                    teams GET    /teams(.:format)                     teams#index
#                          POST   /teams(.:format)                     teams#create
#                 new_team GET    /teams/new(.:format)                 teams#new
#                edit_team GET    /teams/:id/edit(.:format)            teams#edit
#                     team GET    /teams/:id(.:format)                 teams#show
#                          PUT    /teams/:id(.:format)                 teams#update
#                          DELETE /teams/:id(.:format)                 teams#destroy
#                    tryes GET    /tryes(.:format)                     tryes#index
#                          POST   /tryes(.:format)                     tryes#create
#                 new_trye GET    /tryes/new(.:format)                 tryes#new
#                edit_trye GET    /tryes/:id/edit(.:format)            tryes#edit
#                     trye GET    /tryes/:id(.:format)                 tryes#show
#                          PUT    /tryes/:id(.:format)                 tryes#update
#                          DELETE /tryes/:id(.:format)                 tryes#destroy
#                    codes GET    /codes(.:format)                     codes#index
#                          POST   /codes(.:format)                     codes#create
#                 new_code GET    /codes/new(.:format)                 codes#new
#                edit_code GET    /codes/:id/edit(.:format)            codes#edit
#                     code GET    /codes/:id(.:format)                 codes#show
#                          PUT    /codes/:id(.:format)                 codes#update
#                          DELETE /codes/:id(.:format)                 codes#destroy
#                    games GET    /games(.:format)                     games#index
#                          POST   /games(.:format)                     games#create
#                 new_game GET    /games/new(.:format)                 games#new
#                edit_game GET    /games/:id/edit(.:format)            games#edit
#                     game GET    /games/:id(.:format)                 games#show
#                          PUT    /games/:id(.:format)                 games#update
#                          DELETE /games/:id(.:format)                 games#destroy
#                 ckeditor        /ckeditor                            Ckeditor::Engine
#                    tasks GET    /tasks(.:format)                     tasks#index
#                          POST   /tasks(.:format)                     tasks#create
#                 new_task GET    /tasks/new(.:format)                 tasks#new
#                edit_task GET    /tasks/:id/edit(.:format)            tasks#edit
#                     task GET    /tasks/:id(.:format)                 tasks#show
#                          PUT    /tasks/:id(.:format)                 tasks#update
#                          DELETE /tasks/:id(.:format)                 tasks#destroy
#                     root        /                                    rgame#index
# 
# Routes for Ckeditor::Engine:
#         pictures GET    /pictures(.:format)             ckeditor/pictures#index
#                  POST   /pictures(.:format)             ckeditor/pictures#create
#          picture DELETE /pictures/:id(.:format)         ckeditor/pictures#destroy
# attachment_files GET    /attachment_files(.:format)     ckeditor/attachment_files#index
#                  POST   /attachment_files(.:format)     ckeditor/attachment_files#create
#  attachment_file DELETE /attachment_files/:id(.:format) ckeditor/attachment_files#destroy
