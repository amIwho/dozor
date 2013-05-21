# == Schema Information
#
# Table name: task_orders
#
#  id         :integer          not null, primary key
#  game_id    :integer
#  team_id    :integer
#  task_id    :integer
#  order_n    :integer
#  solved     :boolean
#  dropped    :boolean
#  time_start :datetime
#  time_hint1 :datetime
#  time_hint2 :datetime
#  solve_time :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class TaskOrder < ActiveRecord::Base
  attr_accessible :dropped, :game_id, :order_n, :solve_time, :solved, :task_id, :team_id, :time_hint1, :time_hint2, :time_start
  
  belongs_to :team  
  belongs_to :game
  belongs_to :task
  
  acts_as_list :scope => 'team_id=#{team_id} and game_id=#{game_id}', :column => :order_n

  

  validates :task_id, uniqueness: {scope: :team_id }
 # validates :task_id, uniqueness: {scope: [ :order_n, :team_id] }
 # validates :team_id, uniqueness: {:scope => :order_n}

end
