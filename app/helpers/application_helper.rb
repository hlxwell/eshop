# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

    def render_feedback_list(product_id=nil)
        if product_id
            @feedbacks = Feedback.find(:all,:conditions=>['product_id=?',product_id])
            render :partial=>'/feedbacks/list'
        else
            @feedbacks = Feedback.find :all
            render :partial=>'/feedbacks/list_all'
        end
        
    end

    def render_new_feedback_form(type=nil)
        @feedback = Feedback.new
        if type == 'product'
            render :partial=>'/feedbacks/new_for_product'
        else
            render :partial=>'/feedbacks/new'
        end
    end

    def render_new_order_form(product_id,type=nil)
      @order = Order.new()
      @product_id = product_id.to_s
        if type == 'product'
            render :partial=>'/orders/new_for_product'
        else
            render :partial=>'/orders/new'
        end
    end

end
