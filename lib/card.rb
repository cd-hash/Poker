class Card
    attr_reader :suit, :numerical_value, :face_value

    def initialize(suit, face_value)
        @suit = suit
        @face_value = face_value
    end
end