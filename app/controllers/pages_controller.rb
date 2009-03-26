class PagesController < ApplicationController
  layout proc{ |controller| 
    if controller.action_name !='reservation'
      controller.session[:en] ? "enmain" : "cnmain"
    else
      nil
    end
  }

  def contactus
  end

  def aboutus
  end

  def restaurants

  end
  def sportscenter

  end
  def special

  end
  def reservation
    
  end
  def lang
    if params[:en]
      session[:en]=true
    else
      session[:en]=nil
    end
    redirect_to products_path
  end
end
