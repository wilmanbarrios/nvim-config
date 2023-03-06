-- TODO: automatically run `./install` if any file is created/deleted/renamed in this repo

local api = require('nvim-tree.api')
local plenary = require('plenary.path')
local Event = api.events.Event

local update_symlinks = function()
  local has_dodbot = vim.fn.getcwd():match('nvim%-config') 

  if not has_dodbot then
    return
  end

  -- TODO: defer, I don't want to block the main process in any ways
  vim.fn.system('./install')

  -- TODO: send a notification to let me know when symlink finish
end

api.events.subscribe(Event.NodeRenamed, update_symlinks)
api.events.subscribe(Event.FolderCreated, update_symlinks)
api.events.subscribe(Event.FolderRemoved, update_symlinks)
api.events.subscribe(Event.FileCreated, update_symlinks)
api.events.subscribe(Event.FileRemoved, update_symlinks)
