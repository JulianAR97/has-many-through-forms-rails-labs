class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments

  def categories_attributes=(category_attributes)
    if category_attributes
      category_attributes.values.each do |category_attribute|
        unless category_attribute["name"].empty?
          category = Category.find_or_create_by(name: category_attribute["name"])
          categories << category
        end
      end
    end
  end

end
