-- GUI thing: clear log window
clear()
lmc_xpl_text('From LUA macros')
print('Version: ' .. lmc.version)

print('This is LuaMacros. Listing detected devices...')
lmc_print_devices()

lmc.minimizeToTray = true
if (lmc.minimizeToTray) then
  print('Will minimize to tray')
else
  print('Won\'t minimize to tray')
end
lmc_minimize()

-- add COM port (with default config values) as device
-- 1st param: logical name
-- 2nd param: port name
-- lmc_add_com('C3', 'COM3')
-- add COM port (with full config) as device
-- 1st param: logical name
-- 2nd param: port name
-- 3rd param: baud rate
-- 4th param: data bits (8, 7 , 6, 5)
-- 5th param: parity ('N', 'O', 'E', 'M', 'S')
-- 6th param: stop bits (1,2)
lmc_add_com('ARDUINO', 'COM7', 9600, 8, 'N', 1)

-- check device was added
lmc_print_devices()

-- define callback for whole device using inline function
-- 1st param: logical name
-- 2nd param: callback
lmc_set_handler('ARDUINO',function(comVal)
  print(comVal)
end)

-- send data to COM port
--lmc_send_to_com('ARDUINO', '1')

-- assign logical name to device by regexp
-- 1st arg: logical name
-- 2nd arg: regexp applied on DirectX name
-- returns: Found directX name
-- remember 2nd param is regexp, so any unique part from that ugly keyboard system id works
lmc_device_set_name('NUMPAD', 'PID_8367')
--lmc_assign_keyboard('NUMPAD');

-- define callbacks for specific keys

-- NumpadEnter to Ctrl+K (Wirecast Start/Stop Recording
lmc_set_handler('NUMPAD',13,1,function(button, direction)
  lmc_send_keys('^k')
  lmc_send_to_com('ARDUINO', '1')
end)

-- NumpadEnter to Ctrl+B (Wirecast Start/Stop Recording
--lmc_set_handler('NUMPAD',110,1,function(button, direction)
--  lmc_send_keys('^b')
--end)

-- NumpadSub to Ctrl+1
lmc_set_handler('NUMPAD',109,1,function(button, direction)
  lmc_send_keys('^1')
end)

-- NumpadSub to Ctrl+2
lmc_set_handler('NUMPAD',107,1,function(button, direction)
  lmc_send_keys('^2')
end)

-- Numpad1 to 1 - NumLock ON
lmc_set_handler('NUMPAD',97,1,function(button, direction)
  lmc_send_keys('1')
end)
-- Numpad1 to 1 - NumLock OFF
lmc_set_handler('NUMPAD',35,1,function(button, direction)
  lmc_send_keys('1')
end)

-- Numpad2 to 2 - NumLock ON
lmc_set_handler('NUMPAD',98,1,function(button, direction)
  lmc_send_keys('2')
end)
-- Numpad2 to 2 - NumLock OFF
lmc_set_handler('NUMPAD',40,1,function(button, direction)
  lmc_send_keys('2')
end)

-- Numpad3 to 3 - NumLock ON
lmc_set_handler('NUMPAD',99,1,function(button, direction)
  lmc_send_keys('3')
end)
-- Numpad3 to 3 - NumLock OFF
lmc_set_handler('NUMPAD',34,1,function(button, direction)
  lmc_send_keys('3')
end)

-- Numpad4 to 4 - NumLock ON
lmc_set_handler('NUMPAD',100,1,function(button, direction)
  lmc_send_keys('4')
end)
-- Numpad4 to 4 - NumLock OFF
lmc_set_handler('NUMPAD',37,1,function(button, direction)
  lmc_send_keys('4')
end)

-- Numpad5 to 5 - NumLock ON
lmc_set_handler('NUMPAD',101,1,function(button, direction)
  lmc_send_keys('5')
end)
-- Numpad5 to 5 - NumLock OFF
lmc_set_handler('NUMPAD',12,1,function(button, direction)
  lmc_send_keys('5')
end)

-- Numpad6 to 6 - NumLock ON
lmc_set_handler('NUMPAD',102,1,function(button, direction)
  lmc_send_keys('6')
end)
-- Numpad6 to 6 - NumLock OFF
lmc_set_handler('NUMPAD',39,1,function(button, direction)
  lmc_send_keys('6')
end)

-- NumpadMul to Launch Wirecast and Win+2 (Switch to Wirecast)
lmc_set_handler('NUMPAD',106,1,function(button, direction)
  --lmc_spawn('C:/Program Files/Telestream/Wirecast/Wirecast.exe')
  lmc_send_keys('#2')
end)

-- NumpadDiv to Enable External Display Output
lmc_set_handler('NUMPAD',111,1,function(button, direction)
  lmc_send_keys('%()O{DOWN 4}{RIGHT}{DOWN}{ENTER}')
end)

lmc_set_handler('NUMPAD',function(button, direction)
  if (direction == 1) then return end
  print('Your key ID number is: ' .. button)
end)
