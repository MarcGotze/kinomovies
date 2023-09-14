class UsersController < ApplicationController
  def index
    @users = User.includes(liked_tags: :tag, disliked_tags: :tag).all

    users_with_tags = @users.map do |user|
      {
        id: user.id,
        username: user.username,
        email: user.email,
        image_path: user.image_path,
        liked_tags: user.liked_tags.map { |liked_tag| { id: liked_tag.tag.id, name: liked_tag.tag.name } },
        disliked_tags: user.disliked_tags.map { |disliked_tag| { id: disliked_tag.tag.id, name: disliked_tag.tag.name } }
      }
    end

    render json: users_with_tags
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end
end
