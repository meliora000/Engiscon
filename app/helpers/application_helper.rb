module ApplicationHelper
  def embed(youtube_url)
    if youtube_url include? "youtube"
      youtube_id = youtube_url.split("=").last
      content_tag(:iframe, nil, src: "//www.youtube.com/embed/#{youtube_id}")
    end
  end
end
