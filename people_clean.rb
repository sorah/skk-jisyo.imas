require_relative './util'
apply = ARGV[0] == '--apply' ? ARGV.shift : nil
names_path = ARGV[0] || "#{__dir__}/names.txt"

names = read_names_dic(names_path, include_skip: true).group_by { |_| _[:name] }.map { |k,v| v.last }.sort_by{ |_| _[:reading] || '' }.map{ |_| _.values_at(:name, :reading, :word).join(?\t) }.join(?\n)

puts names
if apply
  warn "=> Applying to #{names_path}"
  File.write names_path, names
end
