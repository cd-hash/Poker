class Card
    attr_reader :suit, :numerical_value, :face_value, :name

    def initialize(suit, numerical_value, face_value)
        @suit = suit
        @numerical_value = numerical_value
        @face_value = face_value
        @name = face_value + ' of ' + suit.to_s
    end
end