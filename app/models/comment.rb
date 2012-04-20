class Comment < ActiveRecord::Base
  belongs_to :article, :foreign_key => 'article_id'
  validates :name, :email, :content, :presence => true
end
