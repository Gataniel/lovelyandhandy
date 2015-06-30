class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable, :trackable, :recoverable, :rememberable
  devise :database_authenticatable, :registerable, :validatable
end
