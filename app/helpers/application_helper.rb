module ApplicationHelper
  def markdown(text)
    options = [Redcarpet::Render::HTML, :hard_wrap => true, :safe_links_only => true, :autolink => true, :space_after_headers => true]
    md = Redcarpet::Markdown.new(*options)
    
    md.render(text).html_safe
      
  end
end
