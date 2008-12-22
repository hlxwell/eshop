class Admin::HomeController < ApplicationController
    layout 'admin',:only=>[:index,:config,:set_login_info,:set_about_us,:set_contact_us]

    def login
        if request.post?
            if params[:login][:username] == Setting.get('admin_username')  and params[:login][:password] == Setting.get('admin_password')
                session[:admin]=true
                redirect_to :controller=>:home,:action=>:index
            else
                flash[:notice]='Invalid Username or Password!'
                render :action=>:login
            end
        end
    end

    def logout
        session[:admin]=nil
        redirect_to root_path
    end

    def set_login_info
        if request.post?
            username = params[:login][:username].strip
            password = params[:login][:password].strip
            if username and password
                #save username and password
                Setting.set('admin_username',username)
                Setting.set('admin_password',password)

                flash[:notice] = 'Username and Password is Successfully configed. '
            end
        end
        render :action=>:config
    end

    def set_about_us
        @setting=Setting.find_by_key('about_us')

        if request.post?
            content = params[:setting][:value].strip
            if content
                Setting.set('about_us',content)
                flash[:notice] = 'About Us is Successfully configed. '
            end
        end
        render :action=>:set_about_us
    end

    def set_contact_us
        @setting=Setting.find_by_key('contact_us')

        if request.post?
            content = params[:setting][:value].strip
            if content
                Setting.set('contact_us',content)
                flash[:notice] = 'Contact Us is Successfully configed. '
            end
        end

        render :action=>:set_contact_us
    end
end
