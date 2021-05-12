require 'pp'
require_relative './util'

source_path = ARGV[0] || "#{__dir__}/dic.utf16le"
names_path = ARGV[0] || "#{__dir__}/names.txt"

items = read_source_dic(source_path)

words = items.group_by{ |_| _[:word] }

names = read_names_dic(names_path).flat_map do |item|
  item[:reading].split(' ').zip(item[:word].split(' ')).map do |(reading, word)|
    annotation = words[item[:name]] && words[item[:name]][0][:annotation]
    {reading: reading, word: word, annotation: "#{item[:name]} (IM@S: #{annotation})"}
  end
end.reject do |item|
  words[item[:word]]
end.to_a

items.concat names

okuri_ari_items, okuri_nasi_items = items.partition { |_| /[ぁ-ゞ][a-z]+\z/ === _[:reading] }

{
  'okuri-ari'  => okuri_ari_items,
  'okuri-nasi' => okuri_nasi_items,
}.each do |head, items|
  dic = items.group_by { |_| _[:reading] }
  puts ";; #{head} entries."
  puts(dic.sort_by(&:first).map do |reading, items|
    "#{reading} /#{items.map{ |_| _[:annotation] ? "#{_[:word]}; #{_[:annotation]}" : _[:word] }.join(?/)}/"
  end.to_a)
end
