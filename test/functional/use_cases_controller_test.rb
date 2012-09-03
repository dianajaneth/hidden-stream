require 'test_helper'

class UseCasesControllerTest < ActionController::TestCase
  setup do
    @use_case = use_cases(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:use_cases)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create use_case" do
    assert_difference('UseCase.count') do
      post :create, use_case: { description: @use_case.description, design_time: @use_case.design_time, is_extra: @use_case.is_extra, is_feature: @use_case.is_feature, name: @use_case.name, programming_time: @use_case.programming_time }
    end

    assert_redirected_to use_case_path(assigns(:use_case))
  end

  test "should show use_case" do
    get :show, id: @use_case
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @use_case
    assert_response :success
  end

  test "should update use_case" do
    put :update, id: @use_case, use_case: { description: @use_case.description, design_time: @use_case.design_time, is_extra: @use_case.is_extra, is_feature: @use_case.is_feature, name: @use_case.name, programming_time: @use_case.programming_time }
    assert_redirected_to use_case_path(assigns(:use_case))
  end

  test "should destroy use_case" do
    assert_difference('UseCase.count', -1) do
      delete :destroy, id: @use_case
    end

    assert_redirected_to use_cases_path
  end
end
