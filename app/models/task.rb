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

class Task < ActiveRecord::Base
  attr_accessible :comments, :fulltext, :game_id, :hint1, :hint2, :image_url, :location, :name

  has_many :codes
  has_many :task_orders, :dependent => :destroy
  has_many :rgames
  belongs_to :game

  validates :name, presence: true


end
