module ApplicationHelper
  def youtube_tag(url, classes: nil)
    render partial: 'shared/video', locals: { url: url, classes: classes }
  end
end
