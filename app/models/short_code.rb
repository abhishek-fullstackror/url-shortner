class ShortCode
    ALPHANUMERIC = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".freeze
    BASE = ALPHANUMERIC.length

    class << self
        def encode(number)
            return ALPHANUMERIC.first if number.zero? || number.nil?

            result = ""

            while number > 0
                index = number % BASE
                char = ALPHANUMERIC[index]
                result += char
                number = number/ BASE
            end
            result
        end

        def decode(string)
            number = 0
        
            string.reverse.each_char.with_index do |char, idx|
                power = BASE ** idx
                char_index = ALPHANUMERIC.index(char)
                number += char_index * power if char_index
            end
            
            return number
        end
    end
        
end

# ShortCode.encode(1234)
# ShortCode.decode("test")
