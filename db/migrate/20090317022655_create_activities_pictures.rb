class CreateActivitiesPictures < ActiveRecord::Migration
  def self.up
    create_table :activities_pictures do |t|
      t.integer :activity_id
      t.integer :parent_id
      t.string :filename
      t.integer :size
      t.string :content_type
      t.integer :width
      t.integer :height
      t.string :thumbnail

      t.timestamps
    end
  end

  def self.down
    drop_table :activities_pictures
  end
end
