class Admin::ActivitiesController < ApplicationController
  layout 'admin'
  # GET /activities
  # GET /activities.xml
  def index
    @activities = Activity.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.xml
  def show
    @activity = Activity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.xml
  def new
    @activity = Activity.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = Activity.find(params[:id])
  end

  # POST /activities
  # POST /activities.xml
  def create
    @activity = Activity.new(params[:activity])

    respond_to do |format|
      if @activity.save
        flash[:notice] = 'Activity was successfully created.'
        format.html { redirect_to(upload_picture_admin_activity_path(@activity)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.xml
  def update
    @activity = Activity.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        flash[:notice] = 'Activity was successfully updated.'
        format.html { redirect_to(admin_activity_path(@activity)) }
      else
       format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.xml
  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to(admin_activities_path) }
      format.xml  { head :ok }
    end
  end

  def edit_images
    @activity = Activity.find(params[:id])
  end
  
  def update_images
    @activity = Activity.find(params[:id])

    params[:pic][:id].each_with_index do |id,index|
      ap=ActivitiesPicture.find(id)
      ap.name=params[:pic][:name][index]
      ap.description=params[:pic][:description][index]
#      ap.update_attributes(params[:pic][index])

      ap.save
    end

    respond_to do |format|
      if @activity.save
        flash[:notice] = 'Activity was successfully updated.'
        format.html { redirect_to(admin_activity_path(@activity)) }
      else
       format.html { render :action => "edit_images" }
      end
    end
  end
end
