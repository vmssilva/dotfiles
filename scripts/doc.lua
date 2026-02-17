#!/usr/bin/env lua

--[[
  @description Display documentation for shell functions
  @note Fully written in Lua. Supports repeated tags and optional function filter
  @usage ./doc.lua <filename> [function_name]
--]]

local GREEN   = "\27[32m"
local CYAN    = "\27[36m"
local BLUE    = "\27[34m"
local MAGENTA = "\27[35m"
local YELLOW  = "\27[33m"
local RED     = "\27[31m"
local RESET   = "\27[0m"

-- Check DOTFILES
local DOTFILES = os.getenv("DOTFILES")
if not DOTFILES then
  io.stderr:write(RED .. "[ERROR] DOTFILES variable is not set.\n" .. RESET)
  os.exit(1)
end

-- Args
local filename = arg[1]
local filter_func = arg[2]  -- optional

if not filename then
  io.stderr:write(RED .. "[ERROR] You must provide a filename.\n" .. RESET)
  os.exit(1)
end

local fullpath = DOTFILES .. "/sources/functions/" .. filename
local file = io.open(fullpath, "r")
if not file then
  io.stderr:write(RED .. "[ERROR] File not found: " .. fullpath .. "\n" .. RESET)
  os.exit(1)
end

print("\n" .. CYAN .. "Documentation for file: " .. filename .. RESET .. "\n")

-- Tables
local functions = {}
local current_tags = {}
local tag_order = {}

-- Read file
for line in file:lines() do
  -- Capture tags
  local tag, value = line:match("^## (@%w+)%s+(.*)")
  if tag then
    current_tags[tag] = current_tags[tag] or {}
    table.insert(current_tags[tag], value)
    table.insert(tag_order, tag)
  end

  -- Capture function definitions
  local fname = line:match("^([a-zA-Z0-9_]+)%s*%(%s*%)%s*{")
  if fname then
    table.insert(functions, {
      name = fname,
      tags = current_tags,
      order = tag_order
    })
    -- Reset for next function
    current_tags = {}
    tag_order = {}
  end
end

file:close()

-- Tag color mapping
local function tag_color(tag)
  if tag == "@version" then return MAGENTA
  elseif tag == "@author" then return YELLOW
  elseif tag == "@usage" then return GREEN
  elseif tag == "@note" then return YELLOW
  else return BLUE
  end
end

-- Print function documentation
for _, f in ipairs(functions) do
  -- If filter_func is provided, skip other functions
  if not filter_func or f.name == filter_func then
    print(CYAN .. "Function: " .. GREEN .. f.name .. RESET)

    if next(f.tags) == nil then
      print("    No tags found for this function.")
    else
      local printed = {}
      for _, tag in ipairs(f.order) do
        local values = f.tags[tag]
        for _, v in ipairs(values) do
          local key = tag .. ":" .. v
          if not printed[key] then
            local color = tag_color(tag)
            -- Improved indentation
            print(string.format("    %-10s: %s%s%s", tag:sub(2), color, v, RESET))
            printed[key] = true
          end
        end
      end
    end

    print("") -- Blank line between functions
  end
end

