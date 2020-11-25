module PostsHelper

  private

  def owner?(object)
    current_user == object.user
  end
  
end
