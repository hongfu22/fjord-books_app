# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).with_attached_image
  end

  def show
    @user = User.find(params[:id])
  end
end
