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
    assert { page.has_css? '#login-btn-dev' }
    assert { page.has_css? '#login-btn-twitter' }
  end

  test 'show login page on click login buttun' do
    visit '/'
    click_link 'login-btn-dev'
    assert { current_path == '/auth/developer' }
    assert { page.has_css? 'input#name' }
    assert { page.has_css? 'input#email' }
  end
  test 'show login page on click login buttun' do
    visit '/'
    click_link 'login-btn-dev'
    assert { current_path == '/auth/developer' }
    assert { page.has_css? 'input#name' }
    assert { page.has_css? 'input#email' }
  end
end
