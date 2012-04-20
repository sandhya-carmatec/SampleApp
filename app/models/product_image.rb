class ProductImage < ActiveRecord::Base
  belongs_to :product, :foreign_key => 'product_id'
  has_attached_file :image,
    :url => "/system/image/:id/image/:style/:filename",
    :path => ":rails_root/public:url",
    :styles => {
    :thumb=> "100x100",
    :small  => "200x200>",
    :large => "350x350>"
  }
end
