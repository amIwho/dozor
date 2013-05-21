# == Schema Information
#
# Table name: tryes
#
#  id         :integer          not null, primary key
#  team_id    :integer
#  code       :string(255)
#  match      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class TryeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
