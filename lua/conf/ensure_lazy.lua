local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.print("Installing lazy.nvim")
	local repo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", repo, lazypath})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{"Failed to git-clone lazy.nvim.", "ErrorMsg"},
			{out, "WarningMsg"},
			{"Press any key to exit..."}
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

