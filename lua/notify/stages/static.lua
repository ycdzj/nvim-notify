local stages_util = require("notify.stages.util")

return function(direction)
  return {
    function(state)
      local next_height = state.message.height + 2
      local next_row = stages_util.available_slot(state.open_windows, next_height, direction)
      if not next_row then
        return nil
      end
      return {
        relative = "editor",
        anchor = "NE",
        width = state.message.width,
        height = state.message.height,
        col = 0,
        row = next_row,
        border = "rounded",
        style = "minimal",
      }
    end,
    function()
      return {
        col = { 0 },
        time = true,
      }
    end,
  }
end
