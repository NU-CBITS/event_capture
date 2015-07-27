require "spec_helper"

module EventCapture
  describe Event do
    describe ".before_create" do
      let(:event) { Event.create! }

      it "sets `emitted_at`" do
        expect(event.emitted_at).to_not be_nil
      end

      it "sets `recorded_at`" do
        expect(event.recorded_at).to_not be_nil
      end
    end
  end
end
