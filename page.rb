class Page
  attr_reader :url, :response

  def initialize(url)
    @url = url
    @response
  end
  
  # Makes the HTTP request
  def fetch!
    @response = Nokogiri::HTML(open(@url))
  end
  
  # Returns the page's title
  def title
    @response.css("title").text
  end
  
  # Returns an Array of URLs (as Stringss)
  def links
    # Research alert!
    # How do you use Nokogiri to extract all the link URLs on a page?
    #
    # These should only be URLs that look like
    #   <a href="http://somesite.com/page.html">Click here!</a>
    # This would pull out "http://somesite.com/page.html"
    @response.css("a").map { |link| link["href"] }
  end
end

# References:
# http://www.rubyinside.com/nethttp-cheat-sheet-2940.html
# http://www.nokogiri.org/tutorials/parsing_an_html_xml_document.html
# http://ruby.bastardsbook.com/chapters/html-parsing/
