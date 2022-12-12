# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_comment, only: %i[edit update destroy]

  def edit; end

  # POST /comments or /comments.json
  def create
    @comment = @commentable.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @commentable, notice: t('controllers.common.notice_create', name: Comment.model_name.human) }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to @commentable, flash: { error: @comment.errors.full_messages } }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
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
    respond_to do |format|
      format.html { redirect_to @commentable, notice: t('controllers.common.notice_destroy', name: Comment.model_name.human) }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:content, :user_id, :commentable_id, :commentable_type)
  end
end
