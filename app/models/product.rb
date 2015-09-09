# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  price       :decimal(8, 2)
#  dimensions  :string
#  size        :string
#  title       :string
#  color       :hstore
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  acts_as_taggable

  has_many :images, as: :imageable, dependent: :destroy
  has_many :videos, as: :videoable, dependent: :destroy
  has_many :reviews
  has_and_belongs_to_many :news

  validates_presence_of :price, :title, :description
  validates_length_of :title, :description, maximum: 30
end
