# -*- coding: utf-8 -*-
require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  setup { visit '/' }

  test 'show session:index on visit root' do
    assert { current_path == '/' }
    assert { page.has_content? 'Todo さん' }
  end

  test 'session:index has login buttons' do
    assert { page.has_css? '#login-btn-dev' }
    assert { page.has_css? '#login-btn-twitter' }
  end

  test 'show login page on click login buttun' do
    click_link 'login-btn-dev'

    assert { current_path == '/auth/developer' }
  end
end
