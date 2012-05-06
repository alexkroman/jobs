class Job < ActiveRecord::Base
  validates_presence_of :title, :name, :email, :description
end
