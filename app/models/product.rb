class Product < ApplicationRecord
  include PgSearch::Model
  has_many :dish_ingredients

  has_many :dishes, through: :dish_ingredients

  validates_presence_of :title, :calorie, :protein, :fat, :carbohydrate, :brand_name
  validates_uniqueness_of :title, scope: :brand_name, message: "this product already exists"

  scope :render_title, -> { order(:title, :brand_name).map { |product| [product.title, product.id] } }
  
  pg_search_scope :search_by_products, against: [:title, :brand_name]


end
