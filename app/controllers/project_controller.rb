class ProjectController < ApplicationController
    
    def list
        @projects.all()
    end

    def new
        if !session['user'].nil?
            @user = session['user']
            @project = Project.new()
        else
            redirect_to :controller=>'user', :action=>'login'
        end
    end

    def project_params
        params.require(:projects).permit(:title,:description)
    end

    def create
        @project = Project.new(project_params)
        if @project.save 
            redirect_to :controller=>'user', :action=>'dashboard'
        else
            #do some code there
            redirect_to :action=>'new', error: not_save
        end
    end

    def show
        @project = Project.find(params[:id])
    end

    def edit
        @project = Project.find(params[:id])
    end

    def project_param
        params.require(:project).permit(:title,:description,:completion) #require(:project)
    end

    def update
        @project = Project.find(params[:id])
        if @project.update_attributes(project_param)
            redirect_to :controller =>"user", :action => 'dashboard'
        else
            # do some code here
        end
    end

    def delete
        Project.find(params[:id]).destroy()
        redirect_to :controller=>'user',:action => 'dashboard'
    end
    
end
