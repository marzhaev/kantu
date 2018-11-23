class CataloguesController < ApplicationController
  def index
    # sss
  end

  def show
    voltage_selector
    flipping_selector

    case
    when Manufacturer.name_to_id(params[:manufacturer]) then
      product_ids = products_db.find({"functor_data.type" => "Relay"}).distinct(:product_id)
      @products = products_db.find({
        _id: {"$in" => product_ids},
        manufacturer_id: Manufacturer.name_to_id(params[:manufacturer])
      }).limit(6).to_a.map!{|p| Product.new(p)}
      @properties = product_properties_db.find({
        product_id: {
          "$in" => @products.collect{ |p| p.id }
        }
      }).limit(6).to_a
    else
      @properties = products_db.find({"functor_data.type" => "Mcb"}).limit(6).to_a
      @products = products_db.find({"functor_data.type" => "Mcb"}).limit(6).map{|h| Product.new(h)}
    end
  end

  def voltage_selector
    return unless params[:voltage]
    default_selector["properties.voltage.min"] = {"$lte" => params[:voltage].to_f}
    default_selector["properties.voltage.max"] = {"$gte" => params[:voltage].to_f}
  end

  def flipping_selector
    return unless params[:flipping]
    default_selector["properties.auxiliary_contacts/flipping_contact.min"] = {"$lte" => params[:flipping].to_f}
    default_selector["properties.auxiliary_contacts/flipping_contact.max"] = {"$gte" => params[:flipping].to_f}
  end

  def default_selector
    @default_selector ||= {type: "Relay"}
  end
end
