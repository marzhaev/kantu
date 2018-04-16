class CataloguesController < ApplicationController
  def index
    # sss
  end

  def show
    case
    when Manufacturer.name_to_id(params[:manufacturer]) then
      product_ids = product_properties_db.find({type: "Relay"}).distinct(:product_id)
      @products = products_db.find({
        _id: {"$in" => product_ids},
        manufacturer_id: Manufacturer.name_to_id(params[:manufacturer])
      }).limit(6).to_a.map!{|p| Product.new(p)}
      @properties = product_properties_db.find({
        type: "Relay",
        product_id: {
          "$in" => @products.collect{ |p| p.id }
        }
      }).limit(6).to_a
    else
      @properties = product_properties_db.find({type: "Relay"}).limit(6).to_a
      @products = Product.find_many( @properties.collect{ |x| x[:product_id] })
    end
  end
end
