require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  setup do
    sign_out
    visit '/'
  end

  test '/ にアクセスするとトップ画面が表示されること' do
    assert { current_path == '/' }
    assert { page.has_content? 'Todo さん' }
  end

  test 'トップ画面にログインボタンが表示されていること' do
    assert { page.has_css? '#login-btn-dev' }
    assert { page.has_css? '#login-btn-twitter' }
  end

  test 'ログインボタンをクリックするとログインページに遷移すること' do
    click_link 'login-btn-dev'

    assert { current_path == '/auth/developer' }
  end
end
