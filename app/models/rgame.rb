# == Schema Information
#
# Table name: rgames
#
#  id                      :integer          not null, primary key
#  game_id                 :integer
#  team_id                 :integer
#  current_task_id         :integer
#  finished_at             :datetime
#  current_task_entered_at :datetime
#  answered_questions      :string(255)      default("'--- []\n'")
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#

class Rgame < ActiveRecord::Base
  attr_accessible :answered_questions, :current_task_entered_at, :current_task_id, :finished_at, :game_id, :team_id
  
  belongs_to :team
  belongs_to :game
  belongs_to :task
  
  scope :finished, :conditions => ['finished_at IS NOT NULL'], :order => 'finished_at ASC'
  scope :finished_before, lambda { |time| { :conditions => ['finished_at < ?', time] } }
    serialize :answered_questions
  scope :of_game, lambda {|game| { :conditions => { :game_id => game.id } } }

end
