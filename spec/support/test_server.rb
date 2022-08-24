# frozen_string_literal: true

# Provides the ability to start and stop a `gobl serve` server on-demand for testing
# purposes. This allows implementing end-to-end tests without the need of mocking HTTP
# calls.
#
# It uses the GOBL CLI bin present at the path specified in `TestServer::GOBL_CLI_PATH`.
# If you wish to upgrade the server, you simply need to overwrite the binary in that
# location with the upgraded version compiled for the target operating system and
# compilation architecture where you'll run the tests.
module TestServer
  GOBL_CLI_PATH = 'spec/support/bin/gobl'

  START_TIMEOUT = 5
  RETRY_WAIT = 0.1

  HOST = '127.0.0.1'
  PORT = 3033

  def start_test_server
    launch_server
    wait_for_server
  end

  def launch_server
    @ts_process = fork do
      $stdout.reopen '/dev/null', 'w'
      exec GOBL_CLI_PATH, 'serve', '-p', PORT.to_s
    end
  end

  def wait_for_server
    max_attempts = (START_TIMEOUT / RETRY_WAIT).to_i

    max_attempts.times do
      begin
        response = Net::HTTP.get_response(HOST, "/", PORT)
        return [HOST, PORT] if response.is_a?(Net::HTTPSuccess)
      rescue Errno::EADDRNOTAVAIL, Errno::ECONNREFUSED
      end

      sleep RETRY_WAIT
    end

    raise 'Test server start timeout expired'
  end

  def stop_test_server
    return unless @ts_process

    Process.kill 'TERM', @ts_process
    Process.wait
  end
end
