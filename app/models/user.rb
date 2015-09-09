# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string           not null
#  last_name              :string           not null
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable
  devise :database_authenticatable, :registerable, :validatable, :rememberable, :omniauthable, :recoverable

  has_many :reviews, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :user_social_networks, dependent: :destroy

  validates :first_name, :last_name, presence: true, length: { maximum: 255 }

  def self.find_or_init_for_oauth(auth, current_user = nil)
    social_link = UserSocialNetwork.find_by(uid: auth.uid, provider: auth.provider)
    user = current_user ? current_user : social_link.try(:user)

    if user.nil?
      email = auth.info.email
      user = User.find_by(email: email)

      if user.nil?
        case auth.provider
        when 'twitter'
          name = auth.info.name.split(' ')
          first_name = name.first
          last_name = name.last
        when 'facebook', 'vkontakte', :google
          first_name = auth.info.first_name
          last_name = auth.info.last_name
        end
        user = User.new(first_name: first_name, last_name: last_name, email: email, password: Devise.friendly_token[0, 10])
      end
    end
    user
  end

  def admin?
    ['gataniel@gmail.com', 'dygt@mail.ru'].include?(email)
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
