class NewslettersController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  
  
 def index
   @newsletters = Newsletter.all
 end

 def new
    @newsletters = Newsletter.new
 end
  
 def create
    @newsletters = Newsletter.new(newsletters_params)

    if @newsletters.save
      redirect_to newsletters_path, notice: "The newsletters #{@newsletters.name} has been uploaded."
    else
      render "new"
    end
 end
  
 def destroy
    @newsletters= Newsletter.find(params[:id])
    @newsletters.destroy
    redirect_to newsletters_path, notice:  "The newsletters #{@newsletters.name} has been deleted."
 end
  
  

private
 def newsletters_params
    params.require(:newsletter).permit(:name, :attachment)
 end
  
 def require_authentication
 end
end
