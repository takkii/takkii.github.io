require 'date'

class WatchDate
  attr_reader :app
  
  def initialize
    @app = puts Time.now
  end

  def remove
    remove_instance_variable(:@app)
  end
end

# About Exception, begin ~ rescue ~ ensure.
begin
  WatchDate.new.remove
rescue StandardError => e
  puts e.backtrace
ensure
  GC.compact
end

# _posts date timestamp
# 2025-01-13 13:39:34 +0900