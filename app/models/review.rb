# == Schema Information
#
# Table name: reviews
#
#  id          :integer          not null, primary key
#  mark        :integer
#  description :text
#  product_id  :integer          not null
#  user_id     :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :product
end
