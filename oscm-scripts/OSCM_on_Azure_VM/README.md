## Installing OSCM on Azure VM

The package contains the OSCM installation script which can be used on the Linux Ubuntu operating system. 

#### Log in to your Azure account, the login window can be opened with the command:

```az login```  

#### To run a script on Windows, run the following commands in PowerShell:  

```[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12```  
```$ScriptFromGitHub = Invoke-WebRequest https://raw.githubusercontent.com/servicecatalog/oscm-dockerbuild/master/oscm-scripts/OSCM_on_Azure_VM/create_vm.ps1```  
```Invoke-Expression $($ScriptFromGitHub.Content)```  

#### To run a script on Linux, run the following command:  

```wget -O - https://raw.githubusercontent.com/servicecatalog/oscm-dockerbuild/master/oscm-scripts/OSCM_on_Azure_VM/create_vm.sh | sudo bash```  

And then follow the displayed messages