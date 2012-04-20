class Article < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  validates :name, :author_name, :content, :presence => true
end
