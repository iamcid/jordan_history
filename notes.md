site = "https://pudding.cool/2018/09/jordans/"

doc = Nokogiri::HTML(open(site))
<!-- this css selector is for each Jordan name. -->
results = doc.css("p.jordanName")[0].text
<!-- this css selector is for each Jordan description -->
results = doc.css("p.jordanInfo")[0].text
<!-- this css selector is for each Jordan release date -->
results = doc.css("p.jordanDate")[0].text
<!-- this css selector is for each Jordan OG price -->
results = doc.css("p.jordanPrice")[0].text
<!-- this css selector is for each Jordan designer -->
results = doc.css("p.jordanDesigner")[0].text
puts results