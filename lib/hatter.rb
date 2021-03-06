require 'terminal'
require 'command_factory'

unless ENV["HEADLESS"]
  begin
    terminal = Terminal.new
    command_factory = CommandFactory.new terminal
    while true do
      terminal.draw
      key = terminal.get_user_input
      cmd = command_factory.cmd key
      cmd.execute
    end
  rescue
    terminal.shutdown
  end
end
