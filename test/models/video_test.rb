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

require 'test_helper'

class VideoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
