class CommentsController < ApplicationController
  
  http_basic_authenticate_with name: "wing", password: "peter", only: :destroy
  
  def create
    @playground = Playground.find(params[:playground_id])
    @comment = @playground.comments.create(comment_params)
    redirect_to playground_path(@playground)
  end
 
  def destroy
    @playground = Playground.find(params[:playground_id])
    @comment = @playground.comments.find(params[:id])
    @comment.destroy
    redirect_to playground_path(@playground)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
  
end
