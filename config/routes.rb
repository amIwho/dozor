Dozor::Application.routes.draw do

  get "task_orders/index_all"

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
  match '/play/:game_id' => 'rgame#show_current_level'
  match '/games/end_game/:game_id' => 'games#end_game'
  match '/games/start_game/:game_id' => 'games#start_game'

  post '/rgame/post_answer' => 'rgame#post_answer'
  
  
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
