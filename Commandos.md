 $ sudo apt update

 $ sudo apt install software-properties-common

 $ sudo add-apt-repository --yes --update ppa:ansible/ansible

 $ sudo apt install ansible

ansible --version
ansible -i hosts all -m ping 

   ansible-playbook -i hosts playbook.yaml 

   

