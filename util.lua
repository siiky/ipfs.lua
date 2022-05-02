local module = {}

function module.assign(t1, t2)
	for k, v in pairs(t2) do
	   t1[k] = v
	end 
	return t1
end

function module.map(func, array)
  for i, v in ipairs(array) do
    array[i] = func(v)
  end
  return array
end

function module.all(pred, array)
  for i, v in pairs(array) do
    if not pred(v, i) then
      return false
    end
  end
  return true
end

function module.map_table(maps, table)
  local ret = {}
  for k, map in pairs(maps) do
    ret[k] = map(table[k])
  end
  return ret
end

function module.table_to_entries(table)
  local ret = {}
  for k, v in pairs(table) do
    ret[#ret + 1] = {k, v}
  end
  return ret
end

function module.append(t1, t2)
  for i, v in ipairs(t2) do
    table.insert(t1, v)
  end
  return t1
end

function module.each(proc, table)
  for k, v in pairs(table) do
    proc(v, k)
  end
end

return module
