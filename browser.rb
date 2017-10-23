require 'net/http'
require 'nokogiri'
require 'open-uri'

require_relative 'page'

class Browser
  def initialize
  end

  def run!
    # Run the browser
    # Display a prompt for a user
    # Parse their input
    # Display useful results by instantiating
    #   a new Page and calling methods on it.
    
    # Questions:
    #  1. How can a user quit the browser gracefully?
    #  2. How can a user ask for help, i.e., how do they know what commands are available to them?

    print "url> "
    input = gets.chomp
    puts "Fetching..."

    page = Page.new(input)

    # Makes the HTTP request
    page.fetch!

    # Returns the URL of the underlying page
    page.url

    # Returns the page's title
    puts "Title: #{page.title}"

    puts "Content length: #{page.response.content.length} characters"

    # Returns an Array of URLs (as Strings)
    puts "Links: "
    puts page.links
  end
end

Browser.new.run!