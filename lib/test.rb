def thrower
  10.times do |i|
    10.times do |j|
      $stdout.puts("#{i}.#{j}")
      throw(:label, j) if i > 2 and j > 2
    end
  end
end

val = catch(:label) do
  thrower
  raise("should never get here")
end

$stdout.puts("val is #{val}")

class Test
  def foo
    throw(:label, "foo")
    "should never get here"
  end

  def bar
    "bar"
  end
end

test = Test.new

puts("foo -> " + catch(:label) {test.foo})
puts("bar -> " + catch(:label) {test.bar})