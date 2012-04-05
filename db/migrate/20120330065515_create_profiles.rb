class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth
      t.string :mobile_no
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :pin_code
      t.string :profile_photo_file_name
      t.string :profile_photo_content_type
      t.integer :profile_photo_file_size
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
