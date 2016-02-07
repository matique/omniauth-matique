require "minitest/autorun"

class Worker < SimpleDelegator
  include ::Minitest::Expectations

  def work
  end
end

describe Worker do
  before do
    @worker = Worker.new(Object.new)
  end

  it "must respond to work" do
    @worker.must_respond_to :work
  end
end
