local Config = require("config")

require("events.workspaceSwitcher")
require("events.status").setup()
-- require('events.left-status').setup()
-- require('events.right-status').setup({ date_format = '%a %H:%M:%S' })
-- require('events.tab-title').setup({ hide_active_tab_unseen = false, unseen_icon = 'circle' })

return Config:init()
    :append(require("config.appearance"))
    :append(require("config.bindings"))
    :append(require("config.domains"))
    :append(require("config.fonts"))
    :append(require("config.general")).options
