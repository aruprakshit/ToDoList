class Task
  include DataMapper::Resource

  property :id, Serial
  property :done, Boolean
  property :description, String
  property :due_date, Date

  def to_s
    description.to_s
  end

  def due_date=(date)
    date = nil if date.to_s.empty?
    super date
  end
end
