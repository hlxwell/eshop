class PagesController < ApplicationController
layout proc{ |controller| controller.params[:en] ? "enmain" : "cnmain" }
    def index
    end

    def contactus
    end

    def aboutus
    end
end
