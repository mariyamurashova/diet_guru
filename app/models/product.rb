class Product < ApplicationRecord
  include PgSearch::Model
  has_many :dish_ingredients

  has_many :dishes, through: :dish_ingredients

  validates :title, :calorie, :protein, :fat, :carbohydrate, :brand_name, presence: true
  validates :title, uniqueness: { scope: :brand_name, message: "this product already exists" }

  scope :render_title, -> { order(:title, :brand_name).map { |product| [product.title, product.id] } }
  
  pg_search_scope :search_by_products, against: [:title, :brand_name]


end
