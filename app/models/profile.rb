class Profile < ActiveRecord::Base
  require 'country_select'
  has_attached_file :profile_photo,
    :default_url => "/images/default_avatar.jpg",
    :url => "/system/profile_image/:id/profile_image/:style/:filename",
    :path => ":rails_root/public:url",
    :styles => {
    :thumb=> "50x50",
    :small  => "200x200>",
    :large => "350x350>"
  }

   belongs_to :user, :foreign_key => 'user_id'
end
