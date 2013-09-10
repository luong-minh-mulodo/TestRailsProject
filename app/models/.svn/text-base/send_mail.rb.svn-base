class SendMail < ActiveRecord::Base
  attr_accessible :to, :body ,:subject 
#  validates_presence_of :to ,on::index
  validates :to, :body ,:subject , presence: true, on::all

#  validates :to, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
end
