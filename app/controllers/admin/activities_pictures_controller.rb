class Admin::ActivitiesPicturesController < ApplicationController
    skip_before_filter :verify_authenticity_token,:only=>[:create]

    def create
        @picture = ActivitiesPicture.new
        @picture.activity_id = params[:activity_id]
        @picture.uploaded_data= params[:Filedata]
        @picture.content_type = File.mime_type?(params[:Filedata].original_filename)

        if @picture.save
            render :text=> @picture.public_filename
        else
            render :text=> @picture.errors.inspect
        end
    end

    def destroy
        @picture = ActivitiesPicture.find(params[:id])
        @picture.destroy

        render :update do |page|
            page.alert('picture is successfully removed!')
            page['picture_'+params[:id]].remove
        end
    end
end
