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
      expect(enigma.generate_offset(nil)).to eq("0176")
    end

    it "#generate_key" do
      expect(enigma.generate_keys.length).to eq(5)
    end
  end
end