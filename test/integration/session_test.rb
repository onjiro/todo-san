# -*- coding: utf-8 -*-
require 'test_helper'

class SessionTest < ActionDispatch::IntegrationTest
  test "the truth" do
    assert { true }
  end

  test 'show session:index on visit root' do
    visit '/'
    assert { current_path == '/' }
    assert { page.has_content? 'Todo さん' }
  end
end
