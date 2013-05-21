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

require 'test_helper'

class TaskOrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
