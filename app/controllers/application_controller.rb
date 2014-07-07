# -*- coding: utf-8 -*-
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorize

  helper_method :current_user

  private
  # ユーザ認証されていない場合、トップページにリダイレクトする
  def authorize
    redirect_to('/') unless current_user
  end

  # キャッシュ、もしくはセッション情報からユーザー情報を取得する
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue ActiveRecord::RecordNotFound => e
      @current_user = nil
    end
  end

  # キャッシュ、およびセッション情報にユーザー情報を格納する
  def current_user=(user)
    @current_user = user
    session[:user_id] = (user) ? user.id: user
  end
end
