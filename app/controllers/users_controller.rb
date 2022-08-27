# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  before_action :authenticate_user!, only: %i[index show]

  def index
    @users = User.order(:id).page(params[:page])
  end

  def show; end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
