require 'test_helper'

class PartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @part = parts(:one)
  end

  test 'should find part' do
    get search_parts_url, params: { search: 'MyString' }.length == 1
  end

  test 'search returns 200' do
    get search_parts_url, params: { search: 'MyString' }
    assert_equal 200, status
  end

  test 'should find engine' do
    get search_parts_url, params: { search: 'Engine' }
    assert_select 'td', 'Engine'
  end

  test 'empty part' do
    p = Part.create({ part: '' })
    refute p.valid?
    refute p.save
    assert_equal({ part: ["can't be blank", 'is too short (minimum is 3 characters)'] },
                  p.errors.messages)
  end

  test 'part with one letter' do
    p = Part.create({ part: 'e' })
    refute p.valid?
    refute p.save
    assert_equal({ part: ['is too short (minimum is 3 characters)'] },
                 p.errors.messages)
  end

  test 'part with two letters' do
    p = Part.create({ part: 'en' })
    refute p.valid?
    refute p.save
    assert_equal({ part: ['is too short (minimum is 3 characters)'] },
                 p.errors.messages)
  end

  test "should get index" do
    get parts_url
    assert_response :success
  end

  test "should get new" do
    get new_part_url
    assert_response :success
  end

  test "should create part" do
    assert_difference('Part.count') do
      post parts_url, params: { part: { part: @part.part } }
    end

    assert_redirected_to part_url(Part.last)
  end

  test "should show part" do
    get part_url(@part)
    assert_response :success
  end

  test "should get edit" do
    get edit_part_url(@part)
    assert_response :success
  end

  test "should update part" do
    patch part_url(@part), params: { part: { part: @part.part } }
    assert_redirected_to part_url(@part)
  end

  test "should destroy part" do
    assert_difference('Part.count', -1) do
      delete part_url(@part)
    end

    assert_redirected_to parts_url
  end
end
