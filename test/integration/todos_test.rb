# -*- coding: utf-8 -*-
require 'test_helper'

class TodosTest < ActionDispatch::IntegrationTest
  setup { sign_in user: 'hoge', email: 'email@integration.test.com' }
  teardown { sign_out }
  teardown { DatabaseRewinder.clean }

  test 'show todos:index after sign in' do
    assert { page.has_content? 'Todo さん' }
    assert { current_path == '/todos' }
  end

  test 'show new todo entry form on finish loaded' do
    assert { page.has_content? 'ロード中...' }

    assert { page.has_no_content? 'ロード中...' }
    assert { page.has_css? '.todo-entry-form' }
  end

  test 'show no todos for new user' do
    assert { page.has_no_content? 'ロード中...' }

    assert { page.has_no_css? '.todo-item' }
  end

end
