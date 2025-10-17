# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024-2025, by Samuel Williams.

require "sus/fixtures/console/captured_logger"

describe Sus::Fixtures::Console::CapturedLogger do
	include Sus::Fixtures::Console::CapturedLogger
	
	it "should capture output" do
		Console.debug("Hello, World!")
		
		expect(console_capture.last).to have_keys(
			severity: be == :debug,
			subject: be == "Hello, World!"
		)
	end
	
	with "#expect_console" do
		it "can use custom expectation" do
			Console.debug("Hello, World!")
			
			expect_console.to have_logged(
				severity: be == :debug,
				subject: be == "Hello, World!"
			)
		end
	end
	
	with "#have_logged" do
		it "can expect specific fields to not be logged" do
			Console.debug("Hello, World!")
			
			expect(console_capture).not.to have_logged(
				severity: be == :info
			)
		end
		
		it "can expect specific fields" do
			Console.debug("Hello, World!")
			
			expect(console_capture).to have_logged(
				severity: be == :debug,
				subject: be == "Hello, World!"
			)
		end
	end
end
