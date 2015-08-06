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

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
