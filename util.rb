def read_source_dic(path)
  source = File.read(path).encode('utf-8', 'utf-16').each_line.map(&:chomp)
  source.reject! { |_| _.empty? || _.start_with?(?!) }

  items = source.map do |line|
    reading, word, kind, annotation = line.sub(/\t$/,'').split(?\t,4)
    reading.tr!('ａ-ｚＡ-Ｚ０-９','a-za-z0-9')
    reading.tr!('＠！：','@!:')
    reading.sub!('ヴ','う゛')
    reading.sub!('&hearts;','♡')
    reading.downcase!
    annotation.sub!('&hearts;','♡')
    word.sub!('&hearts;','♡')
    annotation = nil if !annotation || annotation.empty?
    item = {reading: reading, word: word, kind: kind, annotation: annotation}
    item
  end

  items
end

def read_names_dic(path, include_skip: false)
  File.read(path).each_line.lazy.map(&:chomp).reject { |_| _.start_with?(?#) }.map do |line|
    name, reading, word = line.split(?\t)
    next if include_skip ? false : (!reading || !word)
    {name: name, reading: reading, word: word}
  end.to_a.compact
end
