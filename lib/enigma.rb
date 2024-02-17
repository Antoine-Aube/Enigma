require 'date'

class Enigma
  def encrypt(string, key = nil, date = nil )
    date ||= generate_numeric_date
    key ||= random_digits
    
    keys = generate_keys(key)
    offset = generate_offset(date)
    
    shifts = generate_shifts(keys, offset)
    alphabet = self.alphabet
    encrypted_string = encrypt_string(string, shifts, alphabet)
    output = {
      encryption: encrypted_string,
      key: key,
      date: date
    }
  end

  def encrypt_string(string, shifts, alphabet)
    string_arr = string.downcase.chars
    encrypt_arr = string_arr.map.each_with_index do | char, index |
      if index % 4 == 0
        shift = shifts["A"]
      elsif index % 4 == 1
        shift = shifts ["B"]
      elsif index % 4 == 2
        shift = shifts["C"]
      else
        shift = shifts["D"]
      end

    if alphabet.include?(char)
      starting_index = alphabet.index(char)
      final_index = (starting_index + shift) % alphabet.length 
    end 

      alphabet[final_index]
    end
    encrypt_arr.join("")
  end

  def decrypt(string, key, date = nil )
    date ||= generate_numeric_date
    
    keys = generate_keys(key)
    offset = generate_offset(date)
    
    shifts = generate_shifts(keys, offset)
    alphabet = self.alphabet.reverse
    encrypted_string = encrypt_string(string, shifts, alphabet)
    output = {
      encryption: encrypted_string,
      key: key,
      date: date
    }
  end


  def alphabet
    ("a".."z").to_a << " "
  end

def random_digits
    random_four_digits = rand(1000..9999)
    numeric_string = "0#{random_four_digits}"
end 

  def generate_keys(random_digits)
    {
      "A" => (random_digits[0, 2]).to_i,
      "B" => (random_digits[1, 2]).to_i,
      "C" => (random_digits[2, 2]).to_i,
      "D" => (random_digits[3, 2]).to_i
    }
  end

  def generate_offset(date_generator)
    squared = date_generator.to_i ** 2
    last_four = squared.to_s[-4..]
  end

  def generate_numeric_date
    date = Date.today
    formatted = date.strftime('%d%m%y')
    digits = formatted
  end

  def generate_shifts(keys, offset)
    {
      "A" => keys["A"] + offset[0].to_i,
      "B" => keys["B"] + offset[1].to_i,
      "C" => keys["C"] + offset[2].to_i,
      "D" => keys["D"] + offset[3].to_i
    }
  end
end
