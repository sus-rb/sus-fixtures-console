# frozen_string_literal: true

# Released under the MIT License.
# Copyright, 2024-2025, by Samuel Williams.

require "sus/shared"
require "console"
require "console/capture"
require "console/logger"

module Sus
	module Fixtures
		module Console
			# Shared context for suppressing console output during tests.
			# Redirects all console logging to a null output to prevent noise in test runs.
			module NullLogger
				# @returns [Console::Logger] Logger configured to suppress all output.
				def console_logger
					@console_logger ||= ::Console::Logger.new(::Console::Output::Null.new)
				end
				
				# Set up null logger before test execution and clean up afterwards.
				def around
					::Console.logger = console_logger
					super
				ensure
					::Console.logger = nil
				end
			end
		end
	end
end
