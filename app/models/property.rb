class Property

  include DataMapper::Resource

  property :id,           Serial
  property :name,         String
  property :location,     String
  property :price,        Decimal
  property :description,  String

end
