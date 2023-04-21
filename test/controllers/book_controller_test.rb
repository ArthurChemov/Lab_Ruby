require "test_helper"

class BookControllerTest < ActionDispatch::IntegrationTest
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get book_index_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end

  test "should create book" do
    assert_difference("Book.count") do
      post book_index_url, params: { book: { title: @book.title, year: @book.year, library_id: @book.library_id, author_id: @book.author_id, genre_id: @book.genre_id } }
    end

    assert_redirected_to book_url(Book.last)
  end

  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should edit book" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { title: @book.title, year: @book.year, library_id: @book.library_id, author_id: @book.author_id, genre_id: @book.genre_id } }
    assert_redirected_to book_url(@book)
  end

  test "should destroy book" do
    assert_difference("Book.count", -1) do
      delete book_url(@book)
    end

    assert_redirected_to book_index_url
  end
end
