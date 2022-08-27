# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # deviseのコントローラを使う前に呼ばれるアクション
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    # 新規登録時に名前、郵便番号、住所、自己紹介の取得を許可
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name postcode address introduction])
    # 情報更新時に名前、郵便番号、住所、自己紹介の取得を許可
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name post_code address introduction])
  end
end
