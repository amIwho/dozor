# == Schema Information
#
# Table name: games
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  date        :datetime
#  legend      :text
#  author      :string(255)
#  area        :string(255)
#  equipment   :text
#  coments     :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  current     :bool
#  finished_at :datetime
#

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
