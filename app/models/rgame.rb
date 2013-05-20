class Rgame < ActiveRecord::Base
  attr_accessible :answered_questions, :current_task_entered_at, :current_task_id, :finished_at, :game_id, :team_id
  
  belongs_to :team
  belongs_to :game
  belongs_to :task
  
  scope :finished, :conditions => ['finished_at IS NOT NULL'], :order => 'finished_at ASC'
  scope :finished_before, lambda { |time| { :conditions => ['finished_at < ?', time] } }
    serialize :answered_questions
  
end
