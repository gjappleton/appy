class CommentsController < ApplicationController

  http_basic_authenticate_with name: "gabe", password: "password",
except: [:index, :show]

  def create
    @restaurant = restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.create(comment_params)
    redirect_to restaurant_path(@restaurant)
  end

  def destroy
    @restaurant = restaurant.find(params[:restaurant_id])
    @comment = @restaurant.comments.find(params[:id])
    @comment.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
