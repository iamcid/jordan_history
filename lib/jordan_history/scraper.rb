class JordanHistory::Scraper

    def self.scrape_jordan_info
        url = "https://pudding.cool/2018/09/jordans/"
        doc = Nokogiri::HTML(open(url))
        results = doc.css("div.details-text")
        results.each do |el|
            name = el.css("p.jordanName").text
            release_date = el.css("p.jordanDate").text
            og_price = el.css("p.jordanPrice").text
            designer = el.css("p.jordanDesigner").text
            description = el.css("p.jordanInfo").text
            JordanHistory::Sneaker.new(name, release_date, og_price, designer, description)
        end
    end
end