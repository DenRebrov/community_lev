require __dir__ + "/lib/test.rb"
require __dir__ + "/lib/result.rb"

if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

tester = Test.new
detect_result = Result.new

tester.cycle_questions

puts detect_result.resume[detect_result.scoring(tester.points)]
