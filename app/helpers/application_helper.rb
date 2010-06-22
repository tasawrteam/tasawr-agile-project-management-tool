# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def render_breadcrumbs(links)
    html = '<div class="breadCrumbHolder module"><div id="breadCrumb" class="breadCrumb module"><ul>'

    links.each do |link|
      html << "<li>#{link}</li>"
    end

    html << '</ul></div></div>'
  end

end
