class Post < ActiveRecord::Base
  attr_accessible :code, :language, :size, :user
end
