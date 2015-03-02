require "spec_helper"

module EventCapture
  class FakeARError < ActiveRecord::ActiveRecordError
    attr_reader :record
    def initialize(record)
      @record = record
    end
  end

  describe EventsController, type: :controller do
    describe "POST create" do
      let(:event) do
        double("event",
               id: 1234,
               emitted_at: DateTime.new,
               recorded_at: DateTime.new,
               payload: {}.to_json,
               user_id: "abcd",
               user_agent: "efgh",
               source: "foobar",
               kind: "barfoo")
      end

      before(:each) do
        @routes = Engine.routes
      end

      context "when the event validates" do
        before do
          expect(Event).to receive(:create!) { event }
        end

        it "should return an error message" do
          post :create, format: :json

          assert_response 201
          expect(json["id"]).to eq(1234)
        end
      end

      context "when the event doesn't validate" do
        let(:errors) { double("errors", full_messages: ["baz"]) }

        before do
          expect(Event).to receive(:create!)
            .and_raise(FakeARError.new(event))
          allow(event).to receive(:errors) { errors }
        end

        it "should return an error message" do
          post :create, format: :json

          assert_response 400
          expect(json["error"]).to eq("baz")
        end
      end
    end
  end
end
