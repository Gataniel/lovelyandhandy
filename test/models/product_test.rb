# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  price       :decimal(8, 2)
#  title       :string
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
