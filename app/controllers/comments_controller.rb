# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def edit; end

  # POST /comments or /comments.json
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      # if~elseでまとめるとrubocopで注意されるため1行ずつ条件チェック
      flash.now[:alert] = '無効なコメントです。'
      @report = Report.find(params[:report_id]) if params[:report_id]
      render 'reports/show' if @report
      @book = Book.find(params[:book_id]) if params[:book_id]
      render 'books/show' if @book
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      flash.now[:alert] = '無効なコメントです。'
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content, :user_id, :commentable_id, :commentable_type, :report)
  end
end
