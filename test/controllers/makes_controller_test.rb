require 'test_helper'

class MakesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @make = makes(:one)
  end

  test 'should find make' do
   assert Make.where('make like ?', 'MyString').length == 1
  end

  test 'search returns 200' do
    get search_makes_url, params: { search: 'MyString' }
    assert_equal 200, status
  end

  test 'should find BMW' do
    get search_makes_url, params: { search: 'BMW' }
    assert_select 'td', 'BMW'
  end

  test 'should have make and country fit minimum specs' do
    m = Make.new(make: '')
    c = Make.new(country: '')
    assert_not m.valid?
    assert_not c.valid?
    assert_equal ["can't be blank", 'is too short (minimum is 3 characters)'],
                 m.errors.messages[:make]
    assert_equal ["can't be blank", 'is too short (minimum is 4 characters)'],
                 c.errors.messages[:country]
  end

  test 'should get index' do
    get makes_url
    assert_response :success
  end

  test 'should get new' do
    get new_make_url
    assert_response :success
  end

  test 'should create make' do
    assert_difference('Make.count') do
      post makes_url, params: { make: { country: @make.country, make: @make.make } }
    end

    assert_redirected_to make_url(Make.last)
  end

  test 'should show make' do
    get make_url(@make)
    assert_response :success
  end

  test 'should get edit' do
    get edit_make_url(@make)
    assert_response :success
  end

  test 'should update make' do
    patch make_url(@make), params: { make: { country: @make.country, make: @make.make } }
    assert_redirected_to make_url(@make)
  end

  test 'should destroy make' do
    assert_difference('Make.count', -1) do
      delete make_url(@make)
    end

    assert_redirected_to makes_url
  end
end
