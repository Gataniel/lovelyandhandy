# == Schema Information
#
# Table name: product_categories
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductCategory < ActiveRecord::Base
  has_many :products, dependent: :destroy
end
