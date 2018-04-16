class Manufacturer

  def initialize product_hash
    @manufacturer = product_hash
  end

  def name
    @manufacturer[:name]
  end

  def self.name_to_id name
    case name
    when "Schneider Electric" then BSON::ObjectId.from_string("548ec8ef7365725e954e0300")
    when "Omron" then BSON::ObjectId.from_string("548ec8ef7365725e95fa0300")
    when "Texenergo" then BSON::ObjectId.from_string("548ec8ef7365725e954f0300")
    end
  end

  def self.find manufacturer_id
    raise "Only BSON::ObjectId is acceptable" unless manufacturer_id.is_a?(BSON::ObjectId)
    if self.instance_variables.include?("@manufacturer_#{manufacturer_id}_cache".to_sym)
      return self.instance_variable_get("@manufacturer_#{manufacturer_id}_cache".to_sym)
    end

    r = manufacturers_db.find(_id: manufacturer_id).to_a.first
    if r.nil?
      self.instance_variable_set("@manufacturer_#{manufacturer_id}_cache".to_sym, nil)
    else
      self.instance_variable_set("@manufacturer_#{manufacturer_id}_cache".to_sym, self.new(r))
    end
  end

  def self.name_to_id n = nil
    manufacturers_db.find(name: n).to_a.first&.dig(:_id) if n
  end
end
