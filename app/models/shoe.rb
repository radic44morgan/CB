class Shoe < Couchbase::Model
  attribute :name
  attribute :id
  attribute :size
  attribute :color
  attribute :price


  view :all, :limit => 31

  
end
