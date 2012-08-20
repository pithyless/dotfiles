
def get(path)
  path = Array(path).join(' ')
  cmd = "defaults read #{path}"
  val = `#{cmd}`.strip
  val
end

def set(path, type, value)
  path = Array(path).join(' ')
  cmd = "defaults write #{path} -#{type} #{value}"
  `#{cmd}`
end

def parse_value(value)
  case value
  when Integer
    ['int', value.to_s]
  when TrueClass
    ['int', '1']
  when FalseClass
    ['int', '0']
  when String
    ['string', value]
  else
    fail 'WTF? #{value}'
  end
end


def setting(description, path, value)
  type, value = parse_value(value)

  puts description
  old_value = get(path)
  unless old_value == value
    puts "\t\t'#{old_value}' => '#{value}'"
    set(path, type, value)
  end
end


setting('Menu bar: disable transparency',
        'NSGlobalDomain AppleEnableMenuBarTransparency', 0)

setting('Menu bar: show battery percentage',
        'com.apple.menuextra.battery ShowPercent', 'YES')

setting('Disable opening and closing window animations',
        'NSGlobalDomain NSAutomaticWindowAnimationsEnabled', false)

setting('Expand save panel by default',
        'NSGlobalDomain NSNavPanelExpandedStateForSaveMode', true)

# (e.g. enable Tab in modal dialogs)
setting('Enable full keyboard access for all controls (e.g. Tab in modal dialogs)',
        'NSGlobalDomain AppleKeyboardUIMode', 3)


setting('Disable press-and-hold for keys in favor of key repeat',
        'NSGlobalDomain ApplePressAndHoldEnabled', false)

setting('Set a blazingly fast keyboard repeat rate',
        'NSGlobalDomain KeyRepeat', 0)



setting('Require password after sleep',
        'com.apple.screensaver askForPassword', 1)
setting('Require password 5 seconds after sleep',
        'com.apple.screensaver askForPasswordDelay', 5)

setting('Save screenshots to the desktop',
        'com.apple.screencapture location', "$HOME/Desktop/Screens")

setting('Save screenshots in PNG format',
        'com.apple.screencapture type', 'png')

# `killall Finder`


# TODO:
#
#
# # Increase window resize speed for Cocoa applications
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
#
## Disable Resume system-wide
#defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
#
## Disable automatic termination of inactive apps
#defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true



#
# setting('Do not write to disk when hibernating',
# `rm /private/var/vm/sleepimage`
# pmset -a hibernatemode 0
#


