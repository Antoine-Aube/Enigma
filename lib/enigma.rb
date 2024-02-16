require 'date'

class Enigma
  def encrypt(string, key = nil, date = nil )
    
  end

  def alphabet
    ("a".."z").to_a << ""
  end

  def generate_keys
    random_four_digits = rand(1000..9999)
    numeric_string = "0#{random_four_digits}"
    {
      "A" => (numeric_string[0, 2]).to_i,
      "B" => (numeric_string[1, 2]).to_i,
      "C" => (numeric_string[2, 2]).to_i,
      "D" => (numeric_string[3, 2]).to_i
    }
  end

  def generate_offset(date)
    if date == nil
      squared = generate_numeric_date ** 2
      return last_four = squared.to_s[-4..]
    end
    date
  end

  def generate_numeric_date
    date = Date.today
    formatted = date.strftime('%d%m%y')
    # require 'pry';binding.pry
    digits = formatted.to_i
  end

  def generate_shifts(date)
    offset = generate_offset(date)
    keys = generate_keys
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
pp Enigma.new.generate_offset(nil)



# random_number = format('%05d', rand(0..99999))

# pp random_number

# pp Enigma.new.generate_offset
