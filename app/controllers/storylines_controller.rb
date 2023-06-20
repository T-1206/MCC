class StorylinesController < ApplicationController
def new
    @post = Storyline.new

end

def create
  
    @post = Storyline.new(create_params)
    @post.user=current_user
    puts @post.user
    @post.save
    redirect_to storyline_path(@post.id)

end



def index
    @posts = Post.page(params[:page]).reverse_order
end


def show
    @post = Storyline.find(params[:id])
    @comments =Talk.find(params[:storyline_id])
end


def edit
    if current_user.id==Post.find(params[:id]).user_id
       @post = Post.find(params[:id])
    else
        redirect_to "/forms/#{params[:id]}"
    end
end

def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
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
   params.require(:storyline).permit(:title,:subject,:image,:user_id,:tags)
end

end
