class JordanHistory::Scraper

    def self.scrape_jordan_info
        url = "https://pudding.cool/2018/09/jordans/"
        doc = Nokogiri::HTML(open(url))
        results = doc.css("div.details-text")
        results.each do |sneaker|
            name = sneaker.css("p.jordanName").text
            release_date = sneaker.css("span.date").text
            og_price = sneaker.css("span.price").text
            designer = sneaker.css("span.designer").text
            description = sneaker.css("p.jordanInfo").text
            JordanHistory::Sneaker.new(name, release_date, og_price, designer, description)
        end
    end
end
