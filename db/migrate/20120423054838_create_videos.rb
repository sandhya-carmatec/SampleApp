class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.string :title
      t.text :description
      t.string :state
      t.string :filename
      t.string :content_type
      t.integer :size
      t.string :video_type
      # paper clip columns
      t.string :video_content_type
      t.string :video_file_name
      t.integer :video_file_size
      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end
