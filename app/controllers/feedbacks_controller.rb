class FeedbacksController < ApplicationController

    def index
        @feedback = Feedback.new
        @feedbacks = Feedback.find(:all)

        respond_to do |format|
            format.html # index.html.erb
        end
    end

    def create
        @feedback = Feedback.new(params[:feedback].merge(:product_id=>params[:product_id]))

        respond_to do |format|
            if @feedback.save
                flash[:notice] = 'Feedback was successfully created.'
                format.html {
                    if params[:product_id]
                        redirect_to(product_path(params[:product_id]))
                    else
                        redirect_to(feedbacks_path)
                    end
                }
            else
                format.html { render :action => "new" }
            end
        end

        #        if request.xhr?
        #            render :update do |page|
        #                page.redirect_to :action => 'create'
        #            end
        #        else
        #            redirect_to(:action => 'create')
        #        end

    end
end
