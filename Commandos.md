# mohanad@AWSCloud:/etc/apt/sources.list.d$
# $ sudo apt update
# $ sudo apt install software-properties-common
# $ sudo add-apt-repository --yes --update ppa:ansible/ansible
# $ sudo apt install ansible
#  mohanad@AWSCloud:/etc/apt/sources.list.d$ ansible --version
   ansible 2.10.8
   config file = None
   configured module search path = ['/home/mohanad/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
   ansible python module location = /usr/lib/python3/dist-packages/ansible
   executable location = /usr/bin/ansible
   python version = 3.9.2 (default, Feb 28 2021, 17:03:44) [GCC 10.2.1 20210110]

  
   chmod 400 /home/mohanad/.ssh/id_rsa
   ssh -i /home/mohanad/.ssh/id_rsa ec2-user@52.57.15.136

   ansible -i hosts all -m ping 

   ansible-playbook -i hosts playbook.yaml 

http://3.66.86.53

  
