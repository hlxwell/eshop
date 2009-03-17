class AddNameAndDescriptionToActivitiesPictures < ActiveRecord::Migration
  def self.up
    add_column :activities_pictures,:name,:string
    add_column :activities_pictures,:description,:text
  end

  def self.down
    remove_column :activities_pictures,:description
    remove_column :activities_pictures,:name
  end
end
