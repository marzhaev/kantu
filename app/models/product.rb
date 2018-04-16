class Product

  def initialize product_hash
    @product = product_hash
  end

  def id
    @product[:_id]
  end

  def image_path
    @product[:image_path]
  end

  def name
    @product[:name]
  end

  def article
    @product[:article]
  end

  def price
    if composite
      product_detailed["price"]
    else
      @product[:price]
    end
  end

  def description
    @product[:description] || ""
  end

  def catalogues
    return [] if @product[:catalogue_ids].nil? || @product[:catalogue_ids].empty?
    @catalogues_cache ||= catalogues_db.find(_id: {"$in" => @product[:catalogue_ids]}).to_a
  end

  def pdf_catalogue_ids
    @product[:pdf_catalogue_ids] || []
  end

  def pdf_catalogues
    return [] if pdf_catalogue_ids.empty?
    @pdf_catalogues_cache ||= pdf_catalogues_db.find(_id: {"$in" => pdf_catalogue_ids}).to_a
  end

  def manufacturer
    return @manufacturer_cache if @manufacturer_cache
    @manufacturer_cache = Manufacturer.find(manufacturer_id)
  end

  def manufacturer_id
    @product[:manufacturer_id]
  end

  def texenergo?
    manufacturer_id == Manufacturer.name_to_id("Texenergo")
  end

  def composite
    @product[:composite] || false
  end

  def is_stock?
    if composite
      (product_detailed["stock"] || 0) > 0
    else
      (@product[:stock] || 0) > 0
    end
  end

  def is_stock_mfk?
    return false if @product[:supplier_infos].nil?
    supplier_info = @product[:supplier_infos].find{|si| si[:supplier_code] == "mfk" }
    return false unless supplier_info

    (supplier_info[:quantity] || 0) > 0
  end

  def is_stock_with_mfk?
    is_stock? || is_stock_mfk?
  end

  def product_detailed
    return @product_detailed_cache if @product_detailed_cache
    uri = URI.parse(URI.escape("https://api.texenergo.com/public/products/#{id}"))
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Get.new(uri.request_uri)
    response = http.request(request)
    @product_detailed_cache = JSON.parse(response.body)
  end

  def self.find product_id
    if product_id.is_a?(String) && product_id.length == 24
      product_id = BSON::ObjectId.from_string(product_id)
    end
    Product.new( products_db.find(_id: product_id).to_a.first )
  end

  def self.find_many product_ids
    products_db.find(_id: {"$in" => product_ids}).to_a.map!{|p| Product.new(p)}
  end

end
