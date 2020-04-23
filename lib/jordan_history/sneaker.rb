class JordanHistory::Sneaker

    def self.all
        @@all
    end

    def self.find_by_index(index)
        @@all[index]
    end

    attr_accessor :name, :release_date, :og_price, :designer, :description

    @@all = []

    def initialize(name, release_date, og_price, designer, description)
        @name = name
        @release_date = release_date
        @og_price = og_price
        @designer = designer
        @description = description
        save
    end

    def save
        @@all << self
    end
end