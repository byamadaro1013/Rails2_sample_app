ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

#remenber meの実装を飛ばしたので若干修正
# class ActiveSupport::TestCase
#   # 指定のワーカー数でテストを並列実行する
#   parallelize(workers: :number_of_processors)
#   # test/fixtures/*.ymlのfixtureをすべてセットアップする
#   fixtures :all
# end

class ActiveSupport::TestCase
  # 指定のワーカー数でテストを並列実行する
  parallelize(workers: :number_of_processors)
  # test/fixtures/*.ymlのfixtureをすべてセットアップする
  fixtures :all
end

class ActionDispatch::IntegrationTest

  # テストユーザーがログイン中の場合にtrueを返す
  def is_logged_in?
    !session[:user_id].nil?
  end

  # テストユーザーとしてログインする
  def log_in_as(user)
    session[:user_id] = user.id
  end

  # テストユーザーとしてログインする（統合テスト用）
  def log_in_as(user, password: 'password', remember_me: '1')
    post login_path, params: { session: { email: user.email,
                                          password: password,
                                          remember_me: remember_me } }
  end
end


