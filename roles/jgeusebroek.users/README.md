# Ansible role: users

Manage system user accounts and groups. Tested on RedHat/CentOS or Debian/Ubuntu but should work for most Linux distributions / flavours.

## Requirements

None

## Dependencies

None

## Example Playbook

    - hosts: servers
      roles:
         - { role: jgeusebroek.users, tags: ["users"] }

## Example Variables
	# The location where the pubkeys can be found.
	users_default_pubkey_location: '{{ playbook_dir }}/files/pubkeys/{{ inventory_hostname }}/'

    users_available:
      - username: foo
        uid: 1001
        name: "Foo"
        home: "/var/www/foo"
        upload_key: True
        auth_file: "foocustom.pub" # define specific pubkey file (otherwise it will assume username.pub)
      - username: bar
        uid: 1002
        gid: 1080
        name: "Hello World"
        upload_key: true

    users_deleted:
      - username: barfoo

    users_groups_available:
      - groupname: admin
        gid: 1050
      - groupname: sysgroup
        gid: 801
        is_system_group: True

    users_groups_deleted:
      - deleteme

## License

MIT / BSD

## Author Information

This role was created in 2015 by [Jeroen Geusebroek](http://jeroengeusebroek.nl/).