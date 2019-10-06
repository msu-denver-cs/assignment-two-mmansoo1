require 'test_helper'

class CarsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @car = cars(:one)
  end

  test 'should find car from fixture' do
    assert Car.where('model like ?', 'MyString').length == 2
  end

  test 'searches for car make always return 200' do
    get search_makes_url, params: { search: 'MyString' }
    assert_equal 200, status
  end

  test 'should have model and vin fit min specs' do
    m = Car.new(model: '')
    v = Car.new(vin: '')
    assert_not m.valid?
    assert_not v.valid?
    assert_equal ["can't be blank", 'is too short (minimum is 2 characters)'],
                 m.errors.messages[:model]
    assert_equal ["can't be blank", 'is not a number', 'is too short (minimum is 11 characters)'],
                 v.errors.messages[:vin]
  end

  test 'should get index' do
    get cars_url
    assert_response :success
  end

  test 'should get new' do
    get new_car_url
    assert_response :success
  end



  test 'should create car' do
    assert_difference('Car.count') do
      post cars_url, params: { car: { make_id: @car.make_id, model: @car.model, vin: @car.vin } }
    end

    assert_redirected_to car_url(Car.last)
  end

  test 'should show car' do
    get car_url(@car)
    assert_response :success
  end

  test 'should get edit' do
    get edit_car_url(@car)
    assert_response :success
  end

  test 'should update car' do
    patch car_url(@car), params: { car: { make_id: @car.make_id, model: @car.model, vin: @car.vin } }
    assert_redirected_to car_url(@car)
  end

  test 'should destroy car' do
    assert_difference('Car.count', -1) do
      delete car_url(@car)
    end

    assert_redirected_to cars_url
  end
end
