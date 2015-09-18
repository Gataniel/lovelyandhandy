# == Schema Information
#
# Table name: blogs
#
#  id                 :integer          not null, primary key
#  title              :string           not null
#  content            :text             not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  is_workshop        :boolean          default(FALSE), not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#  description        :text
#

class Blog < ActiveRecord::Base
  acts_as_taggable

  has_many :images,  as: :imageable,   dependent: :destroy
  has_many :videos,  as: :videoable,   dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
  has_and_belongs_to_many :products
  has_attached_file :image, styles: { default: '640>x640>', mini: '128x128' },
    url: '/blogs/:blog_id/:id/:style/:basename.:extension'

  validates_presence_of :title, :content, :description
  validates_length_of :title, maximum: 255

  validates_attachment :image, presence: true, content_type: { content_type: /\Aimage\/.*\Z/ }

  private

  Paperclip.interpolates :blog_id do |attachment, style|
    attachment.instance.id
  end
end
