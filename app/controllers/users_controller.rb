# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.with_attached_avatar.order(:id).page(params[:page])
  end

  def show
    @user = User.find(params[:id])
  end

  def following
    @title = t('views.common.title_follow')
    @user  = User.find(params[:id])
    @users = @user.following.page(params[:page]).with_attached_avatar
    render 'show_follow'
  end

  def followers
    @title = t('views.common.title_follower')
    @user  = User.find(params[:id])
    @users = @user.followers.page(params[:page]).with_attached_avatar
    render 'show_follow'
  end
end
