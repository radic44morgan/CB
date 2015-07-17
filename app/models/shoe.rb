class Shoe < Couchbase::Model
  attribute :name
  attribute :size
  attribute :color
  attribute :price


  view :all, :limit => 40

   before_save do |doc|
    doc.name = doc.name.to_f
    doc.size = doc.size.to_f
    doc.color = doc.color.to_f
    doc.price = doc.price.to_f
	end

end
