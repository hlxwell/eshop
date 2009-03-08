class Admin::NewsTopicsController < ApplicationController
    layout 'admin'

    def index
        @news_topics = NewsTopic.find(:all)

        respond_to do |format|
            format.html
        end
    end

    def show
        @news_topic = NewsTopic.find(params[:id])

        respond_to do |format|
            format.html
        end
    end

    def new
        @news_topic = NewsTopic.new

        respond_to do |format|
            format.html
        end
    end

    def edit
        @news_topic = NewsTopic.find(params[:id])
    end

    def create
        @news_topic = NewsTopic.new(params[:news_topic])

        respond_to do |format|
            if @news_topic.save
                flash[:notice] = 'NewsTopic was successfully created.'
                format.html { redirect_to(admin_news_topic_path(@news_topic)) }
            else
                format.html { render :action => "new" }
            end
        end
    end

    def update
        @news_topic = NewsTopic.find(params[:id])

        respond_to do |format|
            if @news_topic.update_attributes(params[:news_topic])
                flash[:notice] = 'NewsTopic was successfully updated.'
                format.html { redirect_to(admin_news_topic_path(@news_topic)) }
            else
                format.html { render :action => "edit" }
            end
        end
    end

    def destroy
        @news_topic = NewsTopic.find(params[:id])
        @news_topic.destroy

        respond_to do |format|
            format.html { redirect_to(admin_news_topics_url) }
        end
    end
end
