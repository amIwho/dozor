# == Schema Information
#
# Table name: teams
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  cap             :string(255)
#  phone           :string(255)
#  confirm         :boolean
#  login           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  is_admin        :boolean
#

require 'test_helper'

class TeamTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
