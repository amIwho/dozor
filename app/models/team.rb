class Team < ActiveRecord::Base
  has_secure_password
  attr_accessible :cap, :confirm, :login, :name, :password, :password_confirmation, :phone, :is_admin
  
  validates :login, presence: true, uniqueness: true
  
  
  has_many :task_orders, order: "order_n"
  has_many :rgames
  
  
end
