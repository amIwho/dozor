# == Schema Information
#
# Table name: codes
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  dif        :string(255)
#  task_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class CodeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
