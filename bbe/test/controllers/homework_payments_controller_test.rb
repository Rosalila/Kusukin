require 'test_helper'

class HomeworkPaymentsControllerTest < ActionController::TestCase
  setup do
    @homework_payment = homework_payments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:homework_payments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create homework_payment" do
    assert_difference('HomeworkPayment.count') do
      post :create, homework_payment: { homework_id: @homework_payment.homework_id, user_id: @homework_payment.user_id }
    end

    assert_redirected_to homework_payment_path(assigns(:homework_payment))
  end

  test "should show homework_payment" do
    get :show, id: @homework_payment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @homework_payment
    assert_response :success
  end

  test "should update homework_payment" do
    patch :update, id: @homework_payment, homework_payment: { homework_id: @homework_payment.homework_id, user_id: @homework_payment.user_id }
    assert_redirected_to homework_payment_path(assigns(:homework_payment))
  end

  test "should destroy homework_payment" do
    assert_difference('HomeworkPayment.count', -1) do
      delete :destroy, id: @homework_payment
    end

    assert_redirected_to homework_payments_path
  end
end
