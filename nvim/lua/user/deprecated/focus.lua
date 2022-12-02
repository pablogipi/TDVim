local status_ok, focus = pcall(require, "focus")
if not status_ok then
	return
end

focus.setup({
	-- minwidth = 90,
	-- width = 120,
})
