# KubernetesPractice
The goal of this project is to get a 1 master 3 worker node kubernetes cluster setup in virtual box running on Windows 10 as described in this article: 

https://medium.com/@mojabi.rafi/create-a-kubernetes-cluster-using-virtualbox-and-without-vagrant-90a14d791617

The kubernetes nodes (worker/master) should be deployed automatically. 

Requires: 
    - Terraform 
    - Chocolatey 
    - Vagrant

Environment Setup: 

    - Install chocolatey:
        - https://chocolatey.org/install
        - Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
    - Install Terraform: 
        - https://community.chocolatey.org/packages/terraform
        - choco install terraform
    - Install Virtual Box 
        - https://community.chocolatey.org/packages/virtualbox
        - choco install virtualbox
    - Add vboxmanage commadn to path 
        - $env:PATH = $env:PATH + ";C:\Program Files\Oracle\VirtualBox"
        - SET PATH=%PATH%;"C:\Program Files\Oracle\VirtualBox"

Setup 
    - Initialize Terraform: 
        - terraform init 

Referenced Documentation
    - https://registry.terraform.io/providers/leodotcloud/virtualbox/latest/docs/resources/vm
        - Tried this provider but I couldn't get it to ever register the IP address and it would fail out. 
    - https://registry.terraform.io/providers/terra-farm/virtualbox/latest

Current Issues: 
    - terrafomr keeps downloading ubuntu 18.04 
    - Keep running into issues with the virtualbox terraform modules being able to return back the IP address
        - I'm noticing that with terra-farm/virtualbox I'm having an issue trying to setup both NICs at install time 
        - If I add the second NIC after it runs things seems to work okay. 