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
      expect(enigma.alphabet).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", ""])
    end

    it "#generate_offset" do
      allow_any_instance_of(Date).to receive(:strftime).with('%d%m%y').and_return("120225")
      
      expect(enigma.generate_offset(nil)).to eq("0625")
    end

    it "#generate_key" do
      allow_any_instance_of(Object).to receive(:rand).with(1000..9999).and_return(1234)

      expect(enigma.generate_keys.length).to eq(4)
      expect(enigma.generate_keys).to be_a(Object)

      keys = enigma.generate_keys
      expect(keys["A"]).to eq(01)
      expect(keys["B"]).to eq(12)
      expect(keys["C"]).to eq(23)
      expect(keys["D"]).to eq(34)
    end
  end
end