require 'dm-validations'
class User

  include DataMapper::Resource

  property :text, String, length: 255
  property :id, Serial
  property :email, String, format: :email_address
  property :password, String
  property :poster_id, Integer
  property :time, EpochTime

end
