class ActivitiesPicture < ActiveRecord::Base
    belongs_to :activity

    has_attachment :storage => :file_system,
        :path_prefix => 'public/activity_images',
        :thumbnails => { :small => [120,120], :middle =>'555' },
        :content_type => :image,
        :processor=>'MiniMagick',
        :max_size => 10.megabytes

    validates_as_attachment
end
