$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), "lib"))
DUMMY = File.join(File.dirname(__FILE__), "dummy")
$LOAD_PATH.unshift(DUMMY)

require "mongoid"
require "minitest/autorun"
require "minitest/spec"

Mongoid.configure do |config|
  config.master = Mongo::Connection.new.db("mongoid-minitest-test")
end

Dir[File.join(DUMMY, "*.rb")].sort.each { |file| require File.basename(file) }

require "mongoid-minitest"

class MiniTest::Spec
  include Mongoid::MiniTest::Matchers
end