# -*- coding: utf-8 -*-
require 'test_helper'

class TodosTest < ActionDispatch::IntegrationTest
  setup do
    sign_in user: 'todo test user', email: 'email@integration.test.com'
  end
  teardown do
    sign_out
  end

  test 'show todos:index after sign in' do
    assert { page.has_content? 'Todo さん' }
    assert { current_path == '/todos' }
  end

  test 'show new todo entry form on finish loaded' do
    assert { page.has_content? 'ロード中...' }

    wait_for_load_finished
    assert { page.has_css? '.todo-entry-form' }
  end

  test 'show no todos for new user' do
    wait_for_load_finished
    assert { page.has_no_css? '.todo-item' }
  end

  test 'show new todo on enter new todo' do
    wait_for_load_finished
    fill_in 'newtodo-content', with: 'hoge'
    click_link 'add-new-todo-btn'

    assert { page.has_css? '.todo-item' } # view の更新を待つ
    assert { page.all('.todo-item').length == 1 }
  end

  def wait_for_load_finished()
    assert { page.has_no_content? 'ロード中...' }
  end
end
