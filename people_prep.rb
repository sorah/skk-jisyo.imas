require_relative './util'
source_path = ARGV[0] || "#{__dir__}/dic.txt"
names_path = ARGV[1] || "#{__dir__}/names.txt"

if File.exist?(names_path)
  names = read_names_dic(names_path, include_skip: true).group_by { |_| _[:name] }
else
  names = {}
end

items = read_source_dic(source_path)

puts "# Remove given or family name from reading and word,"
puts "# or insert spaces in both reading and word."
puts "# Leaving only <key> marks a key to skip."
puts "# "
puts "# format:  <key>\t<reading>\t<word>"
puts "# to skip: <key>"
items.each do |item|
  next unless item[:kind] == '人名'.freeze
  next if names[item[:word]]
  puts [item[:word], item[:reading], item[:word]].join(?\t)
end.compact

