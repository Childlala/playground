class PlaygroundsController < ApplicationController

    before_action :authenticate_user!, :except => [:index, :show]
    before_action :current_user, :except => [:index]

    def index
    @playgrounds = Playground.all
    
    end

    def show
    @playgrounds = Playground.all
    @playground = Playground.find(params[:id])
    end

    def new
     @playground = current_user.playgrounds.new
    end

    def edit
      @playground = current_user.playgrounds.find(params[:id])
    end


    def create
    
      @playground = current_user.playgrounds.new(playground_params)
      @playground.user = current_user
    if @playground.save
    redirect_to @playground
    else
    render 'new'
    end
    end

    def update
     @playground = current_user.playgrounds.find(params[:id])
     @playground.user = current_user
    if @playground.update(playground_params)
       redirect_to @playground
      else
        render 'edit'
    end
    end

    def destroy
    @playground = current_user.playgrounds.find(params[:id])
    @playground.destroy
 
    redirect_to playgrounds_path
    end

    private
    def playground_params
    params.require(:playground).permit(:title, :text, :picture)
    end

end
