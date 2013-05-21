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

class Team < ActiveRecord::Base
  has_secure_password
  attr_accessible :cap, :confirm, :login, :name, :password, :password_confirmation, :phone, :is_admin
  
  validates :login, presence: true, uniqueness: true
  
  
  has_many :task_orders, order: "order_n"
  has_many :rgames
  
  
end
