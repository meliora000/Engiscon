module CategoriesHelper
  def embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    return "//www.youtube.com/embed/#{youtube_id}"
  end
end
