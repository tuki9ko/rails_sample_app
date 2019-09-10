ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/reporters'
Minitest::Reporters.use!

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include ApplicationHelper

  # テストユーザがログイン中の場合に true を返す
  def is_logged_in?
    !session[:user_id].nil?
  end

  # テストユーザとしてログインする
  def log_in_as(user)
    session[:user_id] = user.id
  end
end

class ActionDispatch::IntegrationTest
  # テストユーザとしてログインする
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: {session: {email: user.email, password: password, remember_me: remember_me}}
  end
end

