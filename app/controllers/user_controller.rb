class UserController < ApplicationController

    def index 
        if !session['user'].nil?
            redirect_to :action=> 'dashboard'
        end
    end

    def new 
        @user = User.new()
    end

    def user_params
        params.require(:users).permit(:fullname,:email,:password)
    end

    def create 
        @user = User.new(user_params)
        if @user.save()  #@user.after_save :method
            redirect_to :action => 'login' #"user/users" #
        else
            #some code here
        end
    end

    def list
        @users = User.all()
    end

    def profile
        @users = User.find(params[:id])
    end

    
    def update_params
        params.require(:users).permit(:fullname, :email, :password)
    end

    def update
        @users = User.find(params[:id])
        if @users.update(update_params)
            redirect_to action: 'profile', notice: "1", id: @users
        else
            redirect_to action: 'profile', notice: "0", id: @users
        end
    end

    def destroy 
        User.find(params[:id]).destroy()
        redirect_to :action => 'list'
    end

    def login
        err = params[:login_err].to_i
        @err_msg = nil
        if err == 419 && session['page'] == "login"
            @err_msg = "Invalid Email/ Password"
        end
    end

    def login_params
        params.require(:users).permit(:email, :password)
    end

    def signin
        session['page'] = nil
        email = login_params['email']
        password = login_params['password']
        result = {}
        ActiveRecord::Base.connection.exec_query(
            "SELECT * FROM users WHERE email='#{email}' AND password='#{password}'"
        ).each do|row| 
            result = {id: row['id'],fullname: row['fullname'],email: row['email'],user_role: row['user_role']}
        end
        
        if !result.empty?
            session['user'] = result
            redirect_to :action=>'dashboard'
            
        else
            session['page'] = "login"
            redirect_to action: 'login', login_err: 419
            #do some code here
        end
    end

    def logout
        session['user'] = nil
        redirect_to '/'
    end

    def dashboard
        @user = session['user']
        @project = Project.all()
    end

end
