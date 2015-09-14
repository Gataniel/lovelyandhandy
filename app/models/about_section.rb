# == Schema Information
#
# Table name: about_sections
#
#  id         :integer          not null, primary key
#  content    :text
#  video_url  :text
#  mail_to    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AboutSection < ActiveRecord::Base
  validates_presence_of :content, :video_url, :mail_to
  validates_length_of :mail_to, maximum: 255
end
