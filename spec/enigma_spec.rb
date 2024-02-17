require 'spec_helper'
require './lib/enigma'

RSpec.describe Enigma do 
  let (:enigma) { Enigma.new }
  describe "initialize" do 
    it "exists" do 
      expect(enigma).to be_a(Enigma)
    end
  end

  describe "instance methods" do 
    it "has an aplhabet method that generates the alaphabet" do 
      expect(enigma.alphabet).to be_a(Array)
      expect(enigma.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
    end

    it "#generate_offset" do
      allow_any_instance_of(Date).to receive(:strftime).with('%d%m%y').and_return("120225")
      
      generated_date = enigma.generate_numeric_date
      expect(enigma.generate_offset(generated_date)).to eq("0625")
    end
    
    it "#generate_key" do
      allow_any_instance_of(Object).to receive(:rand).with(1000..9999).and_return(1234)
      
      digits = enigma.random_digits
      expect(enigma.generate_keys(digits).length).to eq(4)
      expect(enigma.generate_keys(digits)).to be_a(Object)
      
      keys = enigma.generate_keys(digits)
      expect(keys["A"]).to eq(01)
      expect(keys["B"]).to eq(12)
      expect(keys["C"]).to eq(23)
      expect(keys["D"]).to eq(34)
    end
  
    it "#generate shifts" do 
      allow_any_instance_of(Date).to receive(:strftime).with('%d%m%y').and_return("120225")
      allow_any_instance_of(Object).to receive(:rand).with(1000..9999).and_return(1234)
      generated_date = enigma.generate_numeric_date
      digits = enigma.random_digits
      key = enigma.generate_keys(digits)
      offset = enigma.generate_offset(generated_date)
      
      
      shifts = enigma.generate_shifts(key, offset)
      
      expect(shifts["A"]).to eq(1)
      expect(shifts["B"]).to eq(18)
      expect(shifts["C"]).to eq(25)
      expect(shifts["D"]).to eq(39)
    end
  end
  
  describe "encryption" do
    it "main encryption method" do
      allow_any_instance_of(Date).to receive(:strftime).with('%d%m%y').and_return("120225")
      allow_any_instance_of(Object).to receive(:rand).with(1000..9999).and_return(1234)

      string = "hello world"
      key = "02715"
      date = "040895"

      expected_output  = {
        encryption: "keder ohulw",
        key: "02715",
        date: "040895"
      }
      expect(enigma.encrypt(string, key, date)). to eq(expected_output)

    end

    it "encrypts without being given a specific key or date" do 
      allow_any_instance_of(Date).to receive(:strftime).with('%d%m%y').and_return("120225")
      allow_any_instance_of(Object).to receive(:rand).with(1000..9999).and_return(1234)
      expected_output  = {
        encryption: "iwjxpru scb",
        key: "01234",
        date: "120225"
      }

      string = "hello world"
      output = enigma.encrypt(string) 

      expect(output).to eq(expected_output)
    end
  end

  describe "decryption" do 
    it "#decrypt" do 
      string = "hello world"
      key = "02715"
      date = "040895"

      encrypted = enigma.encrypt(string, key, date)

      expected_output  = {
        encryption: "hello world",
        key: "02715",
        date: "040895"
      }
      expect(enigma.decrypt(encrypted[:encryption], key, date)). to eq(expected_output)
    end
  end
end