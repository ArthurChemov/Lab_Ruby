class PagesController < ApplicationController
  def library_info
    @library = Library.paginate(page: params[:page], per_page: 10)
  end

  def user_info
    @user = User.paginate(page: params[:page], per_page: 10)
  end

  def search_library_name
    @library = LibraryQuery.search_library_name(params)
  end

  def search_user_name
    @user = UserQuery.search_user_name(params)
  end

  def search_user_email
    @user = UserQuery.search_user_email(params)
  end
end

class LibraryQuery
  def self.search_library_name(params)
    library = Library.all
    library = library.where(name: params[:name]) if params[:name].present?
    library = library.where('name LIKE ?', "%#{params[:name]}%") if params[:name].present?
    library.order(created_at: :desc)
  end
end

class UserQuery
  def self.search_user_name(params)
    user = User.all
    user = user.where(name: params[:name], surname: params[:surname]) if params[:name].present? && params[:surname].present?
    user = user.where('name LIKE ? AND surname LIKE ?', "%#{params[:name]}%", "%#{params[:surname]}%") if params[:name].present? && params[:surname].present?
    user.order(created_at: :desc)
  end

  def self.search_user_email(params)
    user = User.all
    user = user.where(email: params[:email]) if params[:email].present?
    user = user.where('email LIKE ?', "%#{params[:email]}%") if params[:email].present?
    user.order(created_at: :desc)
  end
end