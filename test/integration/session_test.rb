# -*- coding: utf-8 -*-
require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  test 'show session:index on visit root' do
    visit '/'
    assert { current_path == '/' }
    assert { page.has_content? 'Todo さん' }
  end

  test 'session:index has login buttons' do
    visit '/'
    assert { page.has_css? 'a.login-btn-dev' }
    assert { page.has_css? 'a.login-btn-twitter' }
  end
end
