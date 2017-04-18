# require 'dm-validations'
require 'bcrypt'

class User

attr_reader :password
attr_accessor :password_confirmation

  include DataMapper::Resource

  property :id, Serial
  property :text, String, length: 255
  property :email, String, format: :email_address
  property :password_digest, Text
  property :poster_id, Integer

def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
end

def self.authenticate(email, password)
  user = first(email: email)
  if user && BCrypt::Password.new(user.password_digest) == password
    user
  else
    nil
  end
end

validates_confirmation_of :password

end
