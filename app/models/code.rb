class Code < ActiveRecord::Base
  attr_accessible :dif, :name, :task_id
  belongs_to :task
end
