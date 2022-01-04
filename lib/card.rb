class Card
    attr_reader :suit, :numerical_value, :face_value

    def initialize(suit, numerical_value, face_value)
        @suit = suit
        @numerical_value = numerical_value
        @face_value = face_value
    end
end