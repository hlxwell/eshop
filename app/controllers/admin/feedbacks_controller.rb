class Admin::FeedbacksController < ApplicationController
    layout 'admin'
    def index
        @feedbacks = Feedback.find(:all)

        respond_to do |format|
            format.html # index.html.erb
        end
    end

    def show
        @feedback = Feedback.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
        end
    end

    def new
        @feedback = Feedback.new

        respond_to do |format|
            format.html # new.html.erb
        end
    end

    def edit
        @feedback = Feedback.find(params[:id])
    end

    def create
        @feedback = Feedback.new(params[:feedback])

        respond_to do |format|
            if @feedback.save
                flash[:notice] = 'Feedback was successfully created.'
                format.html { redirect_to(admin_feedback_path(@feedback)) }
            else
                format.html { render :action => "new" }
            end
        end
    end

    def update
        @feedback = Feedback.find(params[:id])

        respond_to do |format|
            if @feedback.update_attributes(params[:feedback])
                flash[:notice] = 'Feedback was successfully updated.'
                format.html { redirect_to(admin_feedback_path(@feedback)) }
            else
                format.html { render :action => "edit" }
            end
        end
    end

    def destroy
        @feedback = Feedback.find(params[:id])
        @feedback.destroy

        respond_to do |format|
            format.html { redirect_to(admin_feedbacks_url) }
        end
    end
end
