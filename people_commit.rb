source_path = ARGV[0] || "#{__dir__}/dic.txt"

source = File.read(source_path).encode('utf-8', 'cp932').each_line.map(&:chomp)
source.reject! { |_| _.empty? || _.start_with?(?!) }

