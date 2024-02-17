require "./lib/enigma"

ARGV == ["./lib/message.txt"]
ARGV[0] == "message.txt"
# ARGV[1] == "encrypted.txt"

message_file = "./lib/message.txt"
encryption_file = File.open("encrypted.txt", "w")

first_line = File.open(message_file, 'r') { |file| file.gets.chomp }

encrypted = Enigma.new.encrypt(first_line)

encrypted_string = encrypted[:encryption]
encryption_key = encrypted[:key]
encryption_date = encrypted[:date]

File.write(encryption_file, encrypted_string)

puts "Created #{encryption_file} with the key #{encryption_key} and date #{encryption_date}"
