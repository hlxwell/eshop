class Picture < ActiveRecord::Base
    belongs_to :product

    has_attachment :storage => :file_system,
        :path_prefix => 'public/product_images',
        :thumbnails => { :small => [120,120], :middle =>'555' },
        :content_type => :image,
        :processor=>'MiniMagick',
        :max_size => 10.megabytes

    validates_as_attachment
end
