Debian-Git
==========

Git is a free and open source distributed version control system designed to handle everything from small to very large projects with speed and efficiency

Requirements
------------

This role requires a debian compliant system such as ubuntu.

Role Variables
--------------

No variables

Dependencies
------------

None

Example Playbook
----------------

    - hosts: servers
      roles:
         - { role: loranger.debian-git }

Tasks
-----

  - Install [git](http://git-scm.com/)
  

License
-------

BSD