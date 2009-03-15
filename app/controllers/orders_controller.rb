class OrdersController < ApplicationController
  layout 'news_topics'
  # GET /orders
  # GET /orders.xml
  def show
    @order = Order.find(params[:id],:include => :product)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @order }
    end
  end

  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        flash[:notice] = 'Order was successfully created.'
        format.html { redirect_to(@order) }
        format.xml  { render :xml => @order, :status => :created, :location => @order }
      else
        format.html { redirect_to(product_path(@order.product_id)) }
        format.xml  { render :xml => @order.errors, :status => :unprocessable_entity }
      end
    end
  end
end
