require "test_helper"

class MapReaderControllerTest < ActionDispatch::IntegrationTest
  setup do
    @map_reader = map_readers(:one)
  end

  test "should get index" do
    get map_reader_index_url
    assert_response :success
  end

  test "should get new" do
    get new_map_reader_url
    assert_response :success
  end

  test "should create map_reader" do
    assert_difference("MapReader.count") do
      post map_reader_index_url, params: { map_reader: { library_id: @map_reader.library_id, user_id: @map_reader.user_id } }
    end

    assert_redirected_to map_reader_url(MapReader.last)
  end

  test "should show map_reader" do
    get map_reader_url(@map_reader)
    assert_response :success
  end

  test "should edit map_reader" do
    get edit_map_reader_url(@map_reader)
    assert_response :success
  end

  test "should update map_reader" do
    patch map_reader_url(@map_reader), params: { map_reader: { library_id: @map_reader.library_id, user_id: @map_reader.user_id } }
    assert_redirected_to map_reader_url(@map_reader)
  end

  test "should destroy map_reader" do
    assert_difference("MapReader.count", -1) do
      delete map_reader_url(@map_reader)
    end

    assert_redirected_to map_reader_index_url
  end
end
