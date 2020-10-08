class ProjectController < ApplicationController
    
    def list
        @projects.all()
    end

    def account
        @project = Project.new()
    end

    def new
        @project = Project.new()
    end

    def project_params
        params.require(:projects).permit(:title,:description,:competion)
    end

    def create
        @project = Project.new(project_params)
        if @project.save 
            redirect_to :action => 'new'
        else
            #do some code there
        end
    end

    def show
        @project = Project.find(params[:id])
    end

    def project_param
        params.require(:projects).permit(:title,:description,:competion) #require(:project)
    end

    def update
        @project = Project.find(params[:id])
        if @project.update_attributes(project_param)
            redirect_to :action => 'show', :id => @project
        else
            # do some code here
        end
    end

    def destroy
        Project.find(params[:id]).destroy()
        redirect_to :action => 'list'
    end
    
end
