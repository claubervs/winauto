#(enable Windows Sandbox)
Enable-WindowsOptionalFeature –FeatureName "Containers-DisposableClientVM" -All -Online

#OR

#(disable Windows Sandbox - default)
#Disable-WindowsOptionalFeature –FeatureName "Containers-DisposableClientVM" -Online