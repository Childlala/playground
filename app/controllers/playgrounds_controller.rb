class PlaygroundsController < ApplicationController

    http_basic_authenticate_with name: "wing", password: "peter", except: [:index, :show]

    def index
    @playgrounds = Playground.all
    end

    def show
    @playground = Playground.find(params[:id])
    end

    def new
     @playground = Playground.new
    end

    def edit
      @playground = Playground.find(params[:id])
    end


    def create
      @playground = Playground.new(playground_params)
    if @playground.save
    redirect_to @playground
    else
    render 'new'
    end
    end

    def update
     @playground = Playground.find(params[:id])
 
    if @playground.update(playground_params)
       redirect_to @playground
      else
        render 'edit'
    end
    end

    def destroy
    @playground = Playground.find(params[:id])
    @playground.destroy
 
    redirect_to playgrounds_path
    end

    private
    def playground_params
    params.require(:playground).permit(:title, :text)
    end

end
