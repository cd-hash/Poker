class Card
    attr_reader :suit, :numerical_value, :face_value

    def initialize(suit, num_value, face_value)
        @suit = suit
        @numerical_value = num_value
        @face_value = face_value
    end
end