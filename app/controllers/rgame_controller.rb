class RgameController < ApplicationController
  skip_before_filter :authorization_admin
	
  before_filter :find_game
  before_filter :find_team
  before_filter :find_or_create_rgame
  before_filter :find_task, :only => [:index, :pass_level!]
  
  def find_game
  	@current_game = Game.where(current: 1).first
  end
  
  def find_team
	  @current_team = Team.find(session[:team_id])
  end
  
  def find_task
	  @current_task = Task.find(@rgame.current_task_id) if @rgame.present?
  end
  
  def update_current_task_entered_at
    @rgame.current_task_entered_at = Time.now
	  @rgame.answered_questions = []
	  @rgame.save!
  end
  
  def find_or_create_rgame
    if @current_game.present?
	  unless @current_game.finished? and @current_game.started? and team_finished?(@current_game, @current_team)
		  @current_team.is_admin ? @team_id = 1 : @team_id = session[:team_id]
      @tasks_for_team = TaskOrder.where(game_id: @current_game.id, team_id: @team_id, solved: nil, dropped: nil).order(:order_n) #список заданий для команды
      @rgame = Rgame.where(team_id: @current_team.id, game_id: @current_game.id, finished_at: nil).first # Rgame.where(team_id: 1, game_id: 1)
      if @rgame.blank?
        if @tasks_for_team.present?
          @rgame = Rgame.create!(game_id: @current_game.id, team_id: @current_team.id, current_task_id: @tasks_for_team.first.task_id, current_task_entered_at: Time.now, answered_questions: %w{})
		    end
      elsif @rgame.current_task_entered_at < @current_game.date
			  update_current_task_entered_at
		  end
	  else
		  flash[:notice] = "Игра закончена"
    end
    else
      flash[:notice] = "Извините, нет активных игр"
    end
  end
  
  def index
    @team_finished = team_finished?(@current_game, @current_team)
    if @rgame.present? and !@team_finished
		  @hint1_time = @rgame.current_task_entered_at + 1.minutes
		  @it_is_time_to_hint1 = @hint1_time < Time.now + 1.second
		  @hint2_time = @rgame.current_task_entered_at + 2.minutes
		  @it_is_time_to_hint2 = @hint2_time < Time.now + 1.second
      @leak_time = @rgame.current_task_entered_at + 3.minutes
		  @it_is_time_to_leak = @leak_time < Time.now + 1.second
      if @it_is_time_to_leak
        pass_level!
        redirect_to root_path, alert: "Вы слили задание!"
      end
    else
      render 'index', notice: 'Ваша команда закончила игру'
    end
  end

  def post_answer
    unless @current_game.finished?
      @code = params[:code].strip #если пробелы
      if check_answer!(@code)
        redirect_to root_path, notice: "Код верен!"
      else
        redirect_to root_path, alert: "Код неверен!"
      end

	  end
  end

   def check_answer!(answer)
    answer.upcase!
    @current_task = Task.find(@rgame.current_task_id)
    if unanswered(@current_task).include?(answer)
		  @rgame.answered_questions << answer
		  @rgame.save!
		  unanswered(@current_task) - [answer]
    	pass_level! if unanswered(@current_task).empty?
    	true
   	else
    	false
    end
  end
  
  def unanswered(task)
	  (task.codes.pluck(:name) - @rgame.answered_questions).to_a
  end
  
  def pass_level!
	  @rgame.finished_at = Time.now
	  @rgame.save!
    @tasks_for_team.find_by_task_id(@current_task.id).update_attributes(:solved => true, :solve_time => Time.now, :time_start => @rgame.created_at)

	
	  current_task = TaskOrder.find_by_task_id(@rgame.current_task_id)
	  unless current_task.last?
	    @rgame = Rgame.create!(game_id: @current_game.id, team_id: @current_team.id, current_task_id: TaskOrder.find_by_task_id(@rgame.current_task_id).lower_item.task_id, current_task_entered_at: Time.now, answered_questions: %w{})
    else
      @this_team_has_finished = true
    end
  
  end
  

  def team_finished?(game, team)
    Rgame.where(:game_id => game, :team_id => team, :finished_at => nil).blank? ? true : false
  end

  def stat
    @teams_ids = Team.pluck(:id)
    @player_ids = Rgame.where(game_id: params[:game_id]).pluck(:team_id).uniq
    @player_names = {}

    @player_ids.each_with_index {|k,i|@player_names[k] =  Team.find(k).name}

    @rgames = Rgame.where(game_id: params[:game_id])


  end

end
