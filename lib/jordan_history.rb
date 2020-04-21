require_relative "./jordan_history/version"
require_relative "./jordan_history/cli"
require_relative "./jordan_history/scraper"
require_relative "./jordan_history/sneaker"


require "pry"
require "nokogiri"
require "open-uri"

module JordanHistory
  class Error < StandardError; end
  # Your code goes here...
end
