# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  fulltext   :text
#  image_url  :string(255)
#  game_id    :integer
#  location   :string(255)
#  hint1      :text
#  hint2      :text
#  comments   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  position   :integer
#

require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
