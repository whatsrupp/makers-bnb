class Space

  include DataMapper::Resource

  property :id,           Serial
  property :name,         String
  property :location,     String
  property :price,        String
  property :description,  String, :length => 255

end
