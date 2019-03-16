class Product
  attr_reader :brand

  def initialize(price_reference, shipping_cost, brand)
    @price_reference = price_reference
    @shipping_cost = shipping_cost
    @brand = Brand.new(brand)
  end

  def price_reference
    @price_reference
  end

  def get_brand
    @brand
  end

  def shipping(price_references, taxes)
    total = 0
    price_references.each_with_index do |value, index|
      if @price_reference < value
        total = @shipping_cost * taxes[index]
        break
      end
    end
    total
  end

end

class Brand

  def initialize(rating)
    @rating = rating
  end

  def factor
    @factor = 1.0
    if @rating == "high"
      @factor = 1.1
    elsif @rating == "low"
      @factor = 0.9
    end
  end

end

############for testing

# product = Product.new(200, 10, "high")
# price_references = [15, 25, 50, 75, 100, 200, 400, 600]
# taxes = [0.75, 0.775, 0.8, 0.825, 0.85, 0.875, 0.9, 0.925, 0.95]
# price_original = (product.price_reference - product.shipping(price_references, taxes) ) * product.brand.factor
# puts("#{price_original}")
