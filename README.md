ansible-pyenv
====================================

[![Build Status](https://travis-ci.org/FGtatsuro/ansible-pyenv.svg?branch=master)](https://travis-ci.org/FGtatsuro/ansible-pyenv)

Ansible role for pyenv.

Requirements
------------

The dependencies on other softwares/libraries for this role.

- Debian
- OSX
  - Homebrew (>= 0.9.5)

Role Variables
--------------

The variables we can use in this role.

|name|description|default|
|---|---|---|
|pyenv_python_versions|Installed python versions with pyenv.|It isn't defined in default. No python is installed.|
|pyenv_global_version|This version is used as global in target host.|It isn't defined in default. Default version isn't set.|
|pyenv_login_shell|Login shell used when this role installs pyenv and python.|/bin/bash|

Role Dependencies
-----------------

The dependencies on other roles for this role.

- FGtatsuro.python-requirements
- FGtatsuro.anyenv

Example Playbook
----------------

    - hosts: all
      roles:
         - { role: FGtatsuro.pyenv }

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

- `anyenv_profile` variable of `FGtatsuro.anyenv` must exist on path `pyenv_login_shell` can load automatically. For example, the combination of `pyenv_login_shell=/bin/bash` and `anyenv_profile=.bash_profile` will be good.
- Tasks of this role are executed by `anyenv_owner`(variable of `FGtatsuro.anyenv`).

License
-------

MIT
