class Task < ActiveRecord::Base
  attr_accessible :comments, :fulltext, :game_id, :hint1, :hint2, :image_url, :location, :name

  has_many :codes
  has_many :task_orders, :dependent => :destroy
  has_many :rgames
  belongs_to :game

  validates :name, presence: true


end
