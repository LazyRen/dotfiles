-- Plugins
require("full-border"):setup {
	type = ui.Border.ROUNDED,
}

require("smart-enter"):setup {
	open_multi = true,
}

require("git"):setup {
	modified_sign = "M",
	untracked_sign = "U",
	added_sign = "A",
}

require("starship"):setup()

-- Show symlink target in status bar
Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

-- Custom linemode: size + modification time
function Linemode:size_and_mtime()
	local time = math.floor(self._file.cha.mtime or 0)
	if time == 0 then
		return ui.Line("")
	end

	local now_year = os.date("%Y")
	local file_year = os.date("%Y", time)

	local time_str
	if now_year == file_year then
		time_str = os.date("%b %d %H:%M", time)
	else
		time_str = os.date("%b %d  %Y", time)
	end

	local size = self._file:size()
	return ui.Line(string.format(
		"%s %s",
		size and ya.readable_size(size) or "-",
		time_str
	))
end
