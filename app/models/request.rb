class Request
include DataMapper::Resource

  belongs_to :space
  belongs_to :user

  property :id, Serial
  property :start_date, Date
  property :end_date, Date

end
