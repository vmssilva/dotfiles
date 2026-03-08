vim.api.nvim_create_user_command("JavaRunFile", function()
	local path = vim.fn.expand("%:p")
	local cmd = { "java", path }
	vim.cmd("TermExec cmd='" .. table.concat(cmd, " ") .. "'")
end, { desc = "Exec Java file", force = true })

vim.api.nvim_create_user_command("JavaRunClass", function()
	local source_file = vim.fn.expand("%:p")
	local project_dir = string.match(source_file, "(.-)/src/.+")
	local classes_dir = project_dir .. "/target/classes"
	local main_class, _ = string.gsub(string.match(source_file, "src/main/java/(.-)%.java"), "/", ".")

	local cmd = { "java", "-cp", classes_dir, main_class }
	vim.cmd("TermExec cmd='" .. table.concat(cmd, " ") .. "'")
end, { desc = "Exec Java file", force = true })

vim.api.nvim_create_user_command("JavaCompile", function()
	local source_file = vim.fn.expand("%:p")
	local project_dir = string.match(source_file, "(.-)/src/.+")
	local source_dir = project_dir .. "/src/main/java"

	local java_files = vim.fn.glob(source_dir .. "/**/*.java")
	local classes_dir = project_dir .. "/target/classes"
	local cmd = "javac -d " .. classes_dir .. " " .. string.gsub(java_files, "\n", " ")

	vim.cmd("TermExec cmd='" .. cmd .. "'")
end, { desc = "Exec Java file", force = true })

vim.api.nvim_create_user_command("JavaCompileAndRun", function()
	vim.cmd("JavaCompile")
	vim.cmd("JavaRunClass")
end, { desc = "Exec Java file", force = true })
