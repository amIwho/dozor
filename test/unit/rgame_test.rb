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

require 'test_helper'

class RgameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
