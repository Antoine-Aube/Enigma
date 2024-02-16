require 'date'

class Enigma
  def encrypt(string, key = nil, date = nil )
    encrypted_string = []
    digits = random_digits
    if date == nil
      date = date_generator
    end 

    if key == nil
      key = generate_keys(digits)
    end

    offset = generate_offest(date)
    
    shifts = generate_shifts(key, offset)
      
    output = {
      encryption: encrypted_string,
      key: key,
      date: date
    }
  end

  def alphabet
    ("a".."z").to_a << ""
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
    squared = date_generator ** 2
    last_four = squared.to_s[-4..]
  end

  def generate_numeric_date
    date = Date.today
    formatted = date.strftime('%d%m%y')
    digits = formatted.to_i
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

# date = Date.today

# formatted = date.strftime('%d%m%y')

# puts formatted.to_i

# alphabet = ("a".."z").to_a << ""
# date = nil
# keys =  Enigma.new.generate_keys
# offset = Enigma.new.generate_offset(date)
# shifts = Enigma.new.generate_shifts(nil)
# pp keys
# pp offset
# pp shifts
# require 'pry';binding.pry
# pp Enigma.new.generate_offset(nil)



# random_number = format('%05d', rand(0..99999))

# pp random_number

# pp Enigma.new.generate_offset
