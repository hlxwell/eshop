class NewsTopicsController < ApplicationController

    def index
        @news_topics = NewsTopic.find(:all)
        respond_to do |format|
            format.html # index.html.erb
        end
    end

    def show
        @news_topic = NewsTopic.find(params[:id])
        respond_to do |format|
            format.html # show.html.erb
        end
    end

end
