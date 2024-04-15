# frozen_string_literal: true

require 'test_helper'

class BulletinsControllerTest < ActionDispatch::IntegrationTest
  test 'opens all bulletins page' do
    get root_url
    assert_response :success
    assert_select 'h1', 'Bulletins'
  end

  test 'opens one bulletin page with fixture' do
    bulletin = bulletins(:bulletin_1)
    get bulletin_path(bulletin)
    assert_response :success
    assert_select 'h1', 'Bulletin page'
    assert_select 'h4', 'Bulletin 1'
    assert_select 'p', 'Bulletin 1'
  end
end
