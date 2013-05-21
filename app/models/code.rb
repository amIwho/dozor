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

class Code < ActiveRecord::Base
  attr_accessible :dif, :name, :task_id
  belongs_to :task
end
