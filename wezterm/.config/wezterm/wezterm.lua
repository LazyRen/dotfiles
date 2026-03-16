local Config = require("config")

require("events.workspaceSwitcher")
require("events.status").setup()

return Config:init()
    :append(require("config.appearance"))
    :append(require("config.bindings"))
    :append(require("config.domains"))
    :append(require("config.fonts"))
    :append(require("config.general")).options
