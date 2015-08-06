# == Schema Information
#
# Table name: images
#
#  id               :integer          not null, primary key
#  imageable_id     :integer          not null
#  imageable_type   :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  img_file_name    :string           not null
#  img_content_type :string           not null
#  img_file_size    :integer          not null
#  img_updated_at   :datetime         not null
#

class Image < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true

  has_attached_file :img
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/
end
