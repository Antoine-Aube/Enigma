require 'date'

class Enigma
  def encrypt()
    
  end

  def alphabet
    ("a".."z").to_a << ""
  end

  def generate_keys
    random_four_digits = rand(1000..9999)
    "0#{random_four_digits}"
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
    digits = formatted.to_i
  end
end

# date = Date.today

# formatted = date.strftime('%d%m%y')

# puts formatted.to_i

# alphabet = ("a".."z").to_a << ""

pp Enigma.new.generate_offset(nil)

# random_number = format('%05d', rand(0..99999))

# pp random_number

# pp Enigma.new.generate_offset
