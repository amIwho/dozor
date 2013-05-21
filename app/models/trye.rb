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

class Trye < ActiveRecord::Base
  attr_accessible :code, :match, :team_id
end
