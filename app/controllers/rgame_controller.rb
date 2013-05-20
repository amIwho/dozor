class RgameController < ApplicationController
  skip_before_filter :authorization_admin
	
  before_filter :find_game
  before_filter :find_team
  before_filter :find_or_create_rgame
  before_filter :find_task, :only => [:index, :pass_level!, :unanswered]
  
  def find_game
  	@current_game = Game.where(current: 1).first
  end
  
  def find_team
	@current_team = Team.find(session[:team_id])
  end
  
  def find_task
	@current_task = Task.find(@rgame.current_task_id)
  end
  
  def update_current_task_entered_at
    @rgame.current_task_entered_at = Time.now
	answered_questions = []
	@rgame.save!
  end
  
  def find_or_create_rgame
	unless @current_game.finished? and @current_game.started?
	
		@current_team.is_admin ? @tasks_for_team = TaskOrder.where(game_id: @current_game.id, team_id: 1, solved: false, dropped: false).order(:order_n) : @tasks_for_team = TaskOrder.where(game_id: @current_game.id, team_id: session[:team_id], solved: false, dropped: false).order(:order_n) #список заданий для команды
		
		@rgame = Rgame.where(team_id: @current_team.id, game_id: @current_game.id, finished_at: nil).first # Rgame.where(team_id: 1, game_id: 1)
	#
		if @rgame.blank?
			@rgame = Rgame.create!(game_id: @current_game.id, team_id: @current_team.id, current_task_id: @tasks_for_team.first.task_id, current_task_entered_at: Time.now)
			@rgame.answered_questions = []
		elsif @rgame.current_task_entered_at < @current_game.date
			update_current_task_entered_at
		end
	else
		redirect_to rgame_url, notice: "Извините, игра закончена"
	end
  end
  
  def index
		@hint1_time = @rgame.current_task_entered_at + 2.minutes
		@it_is_time_to_hint1 = @hint1_time < Time.now
		@hint2_time = @rgame.current_task_entered_at + 4.minutes
		@it_is_time_to_hint2 = @hint2_time < Time.now
    @leak_time = @rgame.current_task_entered_at + 6.minutes
		@it_is_time_to_leak = @leak_time < Time.now
    pass_level! if @it_is_time_to_leak
  end

  def post_answer
      unless @current_game.finished?
       @code = params[:code].strip #если пробелы
        @answer_was_correct = check_answer!(@code)
	  end
  end

   def check_answer!(answer)
    answer.strip!
    if unanswered.include?(answer)
		@rgame.answered_questions << answer
		@rgame.save!
		unanswered - answer
    	pass_level! if unanswered.empty?
    	true
   	else
    	false
    end
  end
  
  def unanswered
	@current_task.codes.pluck(:name) - @rgame.answered_questions

  end
  
  def pass_level!
	@rgame.finished_at = Time.now
	@rgame.save!
	
	current_task = TaskOrder.find_by_task_id(@rgame.current_task_id)
	unless current_task.last?
		@rgame = Rgame.create!(game_id: @current_game.id, team_id: @current_team.id, current_task_id: TaskOrder.find_by_task_id(@rgame.current_task_id).lower_item.task_id, current_task_entered_at: Time.now)
		@rgame.answered_questions = []
	end
  
  if current_task.last?
    @it_was_last = true
  end
  
  end
  




end
