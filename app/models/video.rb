# == Schema Information
#
# Table name: videos
#
#  id             :integer          not null, primary key
#  url            :text             not null
#  videoable_id   :integer          not null
#  videoable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Video < ActiveRecord::Base
  belongs_to :videoable, polymorphic: true

  validates_presence_of :videoable_id, :videoable_type, :url
end
