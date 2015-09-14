# == Schema Information
#
# Table name: blogs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  content     :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_workshop :boolean          default(FALSE), not null
#

class Blog < ActiveRecord::Base
  acts_as_taggable

  has_many :images,  as: :imageable,   dependent: :destroy
  has_many :videos,  as: :videoable,   dependent: :destroy
  has_many :commets, as: :commentable, dependent: :destroy
  has_and_belongs_to_many :products

  validates_presence_of :title, :content
  validates_length_of :title, maximum: 255
end
