ansible-ndenv
====================================

[![Build Status](https://travis-ci.org/FGtatsuro/ansible-ndenv.svg?branch=master)](https://travis-ci.org/FGtatsuro/ansible-ndenv)

Ansible role for ndenv.

Requirements
------------

The dependencies on other softwares/librarys for this role.

- Debian
- OSX
  - Homebrew (>= 0.9.5)

Role Variables
--------------

The variables we can use in this role.

|name|description|type|default|
|---|---|---|---|
|ndenv_node_versions|Installed node version with ndenv.|list|It isn't defined in default. No nodejs is installed.|
|ndenv_global_version|This version is used as global in target host.|str|It isn't defined in default. Default version isn't set.|
|ndenv_login_shell|Login shell used when this role installs ndenv and nodejs.|str|/bin/bash|

Role Dependencies
-----------------

The dependencies on other roles for this role.

- FGtatsuro.python-requirements
- FGtatsuro.anyenv

Example Playbook
----------------

    - hosts: all
      roles:
         - { role: FGtatsuro.ndenv }

Test on local Docker host
-------------------------

This project run tests on Travis CI, but we can also run them on local Docker host.
Please check `install`, `before_script`, and `script` sections of `.travis.yml`.
We can use same steps of them for local Docker host.

Local requirements are as follows.

- Ansible (>= 2.0.0)
- Docker (>= 1.10.1)

Notes
-----

- `anyenv_profile` variable of `FGtatsuro.anyenv` must exist on path `ndenv_login_shell` can load automatically. For example, the combination of `ndenv_login_shell=/bin/bash` and `anyenv_profile=.bash_profile` will be good.
- Tasks of this role are executed by `anyenv_owner`(variable of `FGtatsuro.anyenv`).

License
-------

MIT
