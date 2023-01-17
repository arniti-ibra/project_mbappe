# Linux VM SSH entry:
The terraform in main.tf generates a private key through which an SSH into your VM is possible. Of course, you can just use Bastion, but I wanted to work out how to enter myself through SSH. I remember during training everyone in charge of the Linux VMs were using Bastion to go into it and I specifically remember Niklas saying he couldn't SSH in.

These are the steps I **wanted** to go through:
1. terraform output -raw tls_private_key > id_rsa
2. ssh -i id_rsa azureuser@<public_ip_address>
The problem is the file we call "id_rsa" is not secure because only the owner should have the ability to read and write changes to it (seeing as it is a private key). So you can't SSH into it. With windows, it's a hassle to change permissions to stuff especially with the command line. I remembered with Rick using Ubuntu we just chmod and then boom permissions have changed. 

The internet agreed with me, this is from Azure's docs:
*Depending on the permissions of your environment, you might get an error when trying to ssh into the virtual machine using the id_rsa key file. If you get an error stating that the private key file is unprotected and can't be used, try running the following command: chmod 600 id_rsa, which will restrict read and write access to the owner of the file.*

BUT, there's another problem, within Ubuntu/WSL because they are linux **sub**systems within windows, I couldn't change file permissions to a file created in Windows by default. Below, I explain how I went about fixing this so I could run my VM through SSH rather than just through Bastion.

3. `terraform output -raw private_key > id_rsa` puts the private key in a file called id_rsa
4. go into UBUNTU or WSL for windows, `sudo apt update && sudo apt upgrade` and then `cd /` to get in root directory
5. `ls -l etc`
6. Skip to step _ if you have a file called wsl.conf
7. We need to create a wsl.conf file in the etc directory
8. (from root directory, repeat cd / if necessary) `cd etc` to get into etc
9. `sudo touch wsl.conf` 
10. `sudo vim wsl.conf`, we need to edit this file we created by putting 2 lines into it (this is a throwback to Rik, vim is an editor)
11. https://www.javatpoint.com/linux-edit-file is a useful website to see how to do stuff in vim.
12. Put these two lines in there, [automount] is on the first line and the equation is on the second line
13. ![Screenshot](image.png)
>1. [automount]
>2. options = "metadata"
14. exit the vim editor and close all ubuntu/wsl shells open.
15. now you are free to do the following commands:
16. `terraform output -raw tls_private_key > id_rsa` (if you ran it already there's no need to run this a second time)
17. **In an Ubuntu/WSL shell**, inside the folder that contains the private key - `chmod 600 id_rsa`
18. As a sanity check, run `ls -l id_rsa`, on the left you see the permissions and they should be this:
19. `-rw-------`, this tells you only the owner has permissions, and those permissions are read and write.
20. Now feel free to run the VM... `ssh -i id_rsa azureuser@<public_ip_address>` 

Given you have done those steps obviously you don't have to redo them, if you're making a linux vm from scratch in the future you'd only need these steps:
1. `terraform output -raw tls_private_key > id_rsa`
2. **in ubuntu/wsl** - `chmod 600 id_rsa`
3. `ssh -i id_rsa azureuser@<public_ip_address>`(Can even be done in Ubuntu/wsl, no need to switch shells) 