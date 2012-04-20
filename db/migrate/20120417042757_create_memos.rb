class CreateMemos < ActiveRecord::Migration
  def self.up
    create_table :memos do |t|
      t.text :memo
      t.string :created_by
      t.date :memo_date
      t.timestamps
    end
  end

  def self.down
    drop_table :memos
  end
end
