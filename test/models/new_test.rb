# == Schema Information
#
# Table name: @blogs
#
#  id          :integer          not null, primary key
#  title       :string           not null
#  content     :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  is_workshop :boolean          default(FALSE), not null
#

require 'test_helper'

class NewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
