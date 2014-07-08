# -*- coding: utf-8 -*-
require 'test_helper'

class TodosTest < ActionDispatch::IntegrationTest
  setup { sign_in user: 'hoge', email: 'email@integration.test.com' }

  test 'show todos:index after sign in' do
    assert { current_path == '/todos' }
    assert { page.has_content? 'Todo さん' }
  end
end
