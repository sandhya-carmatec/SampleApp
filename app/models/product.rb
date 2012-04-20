class Product < ActiveRecord::Base
  belongs_to :category
  has_many :product_images, :dependent => :destroy
  accepts_nested_attributes_for  :product_images,  :allow_destroy  => true,:reject_if => :all_blank
  has_attached_file :store_image,
    :url => "/system/store_image/:id/store_image/:style/:filename",
    :path => ":rails_root/public:url",
    :styles => {
    :thumb=> "100x100",
    :small  => "200x200>",
    :large => "350x350>"
  }
end
