class PagesController < ApplicationController
  layout proc{ |controller| 
      controller.session[:en] ? "enmain" : "cnmain"
  }

  def contactus
    @headpic=10
  end

  def aboutus
    @headpic=2
  end

  def restaurants
    @headpic=5
  end
  
  def sportscenter
    @headpic=6
  end
  
  def special
    @headpic=8
  end
  
  def reservation
    @headpic=1
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
