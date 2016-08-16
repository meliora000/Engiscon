module PostsHelper
  def embed(youtube_url)
    youtube_id = youtube_url.split("=").last
    return youtube_id
  end
end
