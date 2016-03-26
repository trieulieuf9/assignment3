class Event < ActiveRecord::Base
  belongs_to :venue
  belongs_to :category
  belongs_to :user
  has_many :ticket_types

  validate :validate_timings

  validates_presence_of :extended_html_description, :venue, :category, :starts_at
  validates_uniqueness_of :name, uniqueness: {scope: [:venue, :starts_at]}

def validate_timings
  if(starts_at > ends_at)
    errors[:base] << "starts_at must be earlier than ends_at"
  end
end

  def self.search(search)
	  if search
	    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
	  else
	    find(:all)
	  end
	end

end
