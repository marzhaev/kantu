module ApplicationHelper
  def phone_number
    "+7 (495) 419-95-79"
  end

  def hash_to_params h
    h.to_a.map! do |x|
      "#{x[0]}=#{x[1]}"
    end.join("&")
  end
end
