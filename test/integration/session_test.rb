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
  end

  test 'show todos:index on sign in' do
    visit '/auth/developer'
    fill_in 'name' , :with => 'User Name'
    fill_in 'email', :with => 'email@integration.test.com'
    click_button 'Sign In'
    assert { current_path == '/todos' }
  end
end
