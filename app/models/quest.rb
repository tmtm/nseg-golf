class Quest < ActiveRecord::Base
  attr_accessible :description, :title, :status
end
