# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024-2025, by Samuel Williams.

require "sus/fixtures/console/null_logger"

describe Sus::Fixtures::Console::NullLogger do
	include Sus::Fixtures::Console::NullLogger
	
	it "should capture output" do
		expect($stderr).not.to receive(:puts)
		expect($stderr).not.to receive(:write)
		
		Console.debug("Hello, World!")
	end
end
