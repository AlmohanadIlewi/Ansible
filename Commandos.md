 $ sudo apt update
 $ sudo apt install software-properties-common
 $ sudo add-apt-repository --yes --update ppa:ansible/ansible
 $ sudo apt install ansible
ansible --version
   chmod 400 /home/mohanad/.ssh/id_rsa
   ssh -i /home/mohanad/.ssh/id_rsa ec2-user@52.57.15.136

   ansible -i hosts all -m ping 

   ansible-playbook -i hosts playbook.yaml 

