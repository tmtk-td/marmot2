class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  def index
    @comments = Comment.all
  end
  def new
    @comment = Comment.new
  end
  def create
    @comment = Comment.new(comment_params)
    if params[:back]
      render :new
    else  
      if @comment.save
        # 一覧画面へ遷移して"作成しました！"とメッセージを表示します。
        redirect_to comments_path, notice: "作成しました！"
      else
        # 入力フォームを再描画します。
        render :new
      end
    end  
  end
  def show
  end
  def edit
  end
  def update
    if @comment.update(comment_params)
      redirect_to comments_path, notice: "編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @comment.destroy
    redirect_to comments_path, notice:"削除しました！"
  end
  def confirm
    @comment = Comment.new(comment_params)
  end
  private
  def comment_params
    params.require(:comment).permit(:studytitle, :content)
  end
  def set_comment
    @comment = Comment.find(params[:id])
  end
end
