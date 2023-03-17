# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_book, only: %i[create]
  before_action :set_comment, only: %i[edit update destroy]
  before_action :set_report, only: %i[create]
  before_action :correct_user, only: %i[edit update destroy]

  def edit; end

  # POST /comments or /comments.json
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human)
    else
      # commentable_type(親要素のクラス名)を小文字にし、ファイルパスに対応させ、レンダリング先を動的に設定
      # ex) Book -> book -> book/show
      render "#{@comment.commentable_type.downcase.pluralize}/show"
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @commentable, notice: t('controllers.common.notice_update', name: Comment.model_name.human)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:book_id]) if params[:book_id]
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_report
    @report = Report.find(params[:report_id]) if params[:report_id]
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content, :user_id, :commentable_id, :commentable_type, :report)
  end

  def correct_user
    redirect_to polymorphic_url(@comment.commentable), notice: t('errors.messages.wrong_user') unless @comment.user != current_user
  end
end
