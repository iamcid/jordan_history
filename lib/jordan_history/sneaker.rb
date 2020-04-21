class JordanHistory::Sneaker

    def self.create(name, release_date, og_price, designer, description)
        sneaker = self.new(name, release_date, og_price, designer, description)
        save
    end

    def self.all
        @@all
    end

    def self.find(input)
        self.all[input-1]
    end
    
    attr_accessor :name, :release_date, :og_price, :designer, :description

    @@all = []

    def initialize(name, release_date, og_price, designer, description)
        @name = name
        @release_date = release_date
        @og_price = og_price
        @designer = designer
        @description = description
    end

    def save
        @@all << self
    end
end