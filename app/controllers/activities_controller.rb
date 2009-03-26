class ActivitiesController < ApplicationController
layout proc{ |controller| controller.session[:en] ? "enmain" : "cnmain" }
  # GET /activities
  # GET /activities.xml
  def index
    @activities = Activity.paginate :page => params[:page], :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end
end
