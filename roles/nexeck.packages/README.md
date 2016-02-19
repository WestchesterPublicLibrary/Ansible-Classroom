Packages
=========

Install Packages

Example Playbook
----------------

    - hosts: servers
      roles:
       - role: nexeck.packages
         packages: # list of packages
           - name: htop
             state: latest
           - curl
