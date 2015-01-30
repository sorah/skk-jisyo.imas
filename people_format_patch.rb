require 'pp'
require_relative './util'
source_path = ARGV[0] || "#{__dir__}/dic.txt"
working_path = "#{__dir__}/names.working.txt"

dic = read_source_dic(source_path).group_by{ |_| _[:word] }

works = read_names_dic(working_path, include_skip: true).group_by do |item|
  item[:name]
end

names = {}

works.each do |name, items|
  item = items[0]
  if items.size > 1
    warn "WARN: #{name} have multiple items"
    next
  end
  if (!item[:reading] && !item[:word]) || (item[:reading] == '' && item[:word] == '')
    # skip
    puts name
    next
  end
  
  if item[:reading].include?(' ') && item[:word].include?(' ')
    if item[:reading].split(' ').size != item[:word].split(' ').size
      warn "WARN: #{item.inspect} is not equal between word and reading splits"
      next
    end
    puts [name, reading, word].join(?\t)
  else
    reading = dic[name][0][:reading]

    escaped_reading = Regexp.escape(item[:reading])
    escaped_word = Regexp.escape(item[:word])
    splitted_reading = reading.sub(/\A#{escaped_reading}/, '\0 ').sub(/#{escaped_reading}\z/, ' \0').strip
    splitted_word   = name.sub(/\A#{escaped_word}/, '\0 ').sub(/#{escaped_word}\z/, ' \0').strip
    if splitted_word == name || splitted_reading == reading
      warn "WARN: #{item.inspect} keeps the same"
      next
    end
    if splitted_word.split(' ').size != splitted_reading.split(' ').size
      warn "WARN: #{item.inspect} is not equal between word and reading splits"
      next
    end
    puts [name, splitted_reading, splitted_word].join(?\t)
  end
end
