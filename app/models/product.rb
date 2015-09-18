# == Schema Information
#
# Table name: products
#
#  id                  :integer          not null, primary key
#  price               :decimal(8, 2)
#  title               :string
#  description         :text
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_category_id :integer
#

class Product < ActiveRecord::Base
  acts_as_taggable

  belongs_to :product_category
  has_many :images, as: :imageable, dependent: :destroy
  has_many :videos, as: :videoable, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_and_belongs_to_many :blogs

  validates_presence_of :price, :title, :description, :product_category
  validates_length_of :title, :description, maximum: 30

  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :videos, allow_destroy: true
end
