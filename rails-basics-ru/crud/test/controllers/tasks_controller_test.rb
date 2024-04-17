# frozen_string_literal: true

require 'test_helper'

class TasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @task = tasks(:one)
  end

  test 'should get index' do
    get tasks_path
    assert_response :success
  end

  test 'opens all bulletins page' do
    get root_url
    assert_response :success
    assert_select 'h1', 'Tasks'
  end

  test 'opens one task page with fixture' do
    task = tasks(:one)
    get task_path(task)
    assert_response :success
    assert_select 'h1', 'Show Task'
    assert_select 'p', 'Название MyString'
  end
end
