class PostsController < ApplicationController
  before_action :stub_company

  def index
    @posts = Post.all
  end
end
