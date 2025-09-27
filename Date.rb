require 'date'
require 'tanraku'

class WatchDate
  attr_reader :app
  
  def initialize
    @app = Time.now
  end

  def remove
    remove_instance_variable(:@app)
  end
end

# About Exception, begin ~ rescue ~ ensure.
begin
  puts WatchDate.new.remove
rescue StandardError => e
  puts e.backtrace
  tanraku_execute
ensure
  GC.auto_compact
end

# _posts date timestamp
# 2025-01-13 13:39:34 +0900