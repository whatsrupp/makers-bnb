class User

  include DataMapper::Resource

  property :text, String, length: 255
  property :id, Serial
  property :poster_id, Integer
  property :time, EpochTime

end
