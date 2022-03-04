class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen
    record(yield) if block_given?
  end

  def play
    puts @recordings.last
  end
end


listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"


=begin
- if something is said, a block is passed to the method containing the message
- if nothing is said, no block is passed
- Device#play should output the most recent recording.
=end