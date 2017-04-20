class Request
include DataMapper::Resource

  belongs_to :space
  belongs_to :user

  property :id, Serial
  property :requested_start, Date
  property :requested_end, Date

end
