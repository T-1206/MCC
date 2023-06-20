class StorylinesController < ApplicationController
  def new
    @post = Storyline.new

  end

  def create
    @post = Storyline.new(create_params)
    @post.user_id = current_user.id
    @post.save
    Talkroom.create(storyline_id: @post.id, user_id: current_user.id)
    add_user(4, @post.id)
    redirect_to storyline_path(@post.id)

  end

  def index
    @posts = Storyline.page(params[:page]).reverse_order
  end

  def show
    storyline = Storyline.find(params[:id])
    if storyline.private == true
      if storyline.users.include?(current_user)
        @user = storyline.users
        @post = Storyline.find(params[:id])
        @comments = Talk.where(storyline_id: params[:id])

      else
        redirect_to "/storylines"
      end
    else
      @user = storyline.users
      @post = Storyline.find(params[:id])
      @comments = Talk.where(storyline_id: params[:id])
    end

  end

  def edit
    if current_user == Storyline.find(params[:id])
      # トークルームに所属しているユーザーを返す
      @user = User.find(storyline_id: params[:id])
      @post = Storyline.find(params[:id])
    else
      redirect_to "/storylines/#{params[:id]}"
    end
  end

  def update
    @post = Storyline.new(perams[:id])
    if @post.update(create_params)
      redirect_to form_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/forms'
  end

  def default_url
    'sample.jpg'
  end

  private

  def create_params
    params.require(:storyline).permit(:title, :subject, :image, :user_id, :tags, :private)
  end

  public

  def add_user(user, storyline)
    @group = Storyline.find(storyline)
    member = User.find(user)
    @group.users << member
  end
end
