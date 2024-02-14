require 'date'

class Enigma
  def encrypt()
    
  end

  def alphabet
    ("a".."z").to_a << ""
  end

  def generate_keys

  end

  def generate_offset(date)
    if date !=nil
      date = Date.today
      formatted = date.strftime('%d%m%y')
      digits = formatted.to_i
      squared = digits ** 2
      last_four = squared.to_s[-4..]
    end
    date
  end
end

# date = Date.today

# formatted = date.strftime('%d%m%y')

# puts formatted.to_i

# alphabet = ("a".."z").to_a << ""

# pp alphabet

# random_number = format('%05d', rand(0..99999))

# pp random_number

# pp Enigma.new.generate_offset
