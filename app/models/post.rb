class Post < ActiveRecord::Base
  attr_accessible :code, :language, :size, :user
  belongs_to :user
end
