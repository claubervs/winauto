

# (Turn on Windows Defender Application Guard)
Enable-WindowsOptionalFeature -FeatureName "Windows-Defender-ApplicationGuard" -Online

#OR

# (Turn off Windows Defender Application Guard) - default action
#Disable-WindowsOptionalFeature -FeatureName "Windows-Defender-ApplicationGuard" -Online