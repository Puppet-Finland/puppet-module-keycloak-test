# puppet-module-keycloak-test

This repository aims to make running of puppet-module-keycloak Docker-based
Beaker acceptance tests easier. It can also be used to run unit tests and run
validation.

This repository is useful only if you don't want or can't run Docker and all
the other requirements on your development workstation.

# Setup

The Vagrantfile assumes that it can find ../puppet-module-keycloak where you
develop the code. If that is the case then you should be able to just

    $ vagrant up
    $ vagrant ssh
    $ cd puppet-module-keycloak

Then run any tests you need with pdk.

Remove `spec/fixtures/modules/keycloak` symbolic link

# Running validation

    $ pdk validate

# Running unit tests

    $ pdk test unit

# Running acceptance tests

Ensure that you have run

    $ pdk bundle install

in the puppet-module-keycloak directory.

To launch a subset of non-domain-mode tests:

    PUPPET_INSTALL_TYPE=agent \
    BEAKER_PUPPET_COLLECTION=puppet6 \
    BEAKER_set=centos-7 \
    BEAKER_keycloak_domain_mode_cluster=no \
    BEAKER_destroy=yes \
    pdk bundle exec rspec spec/acceptance

To run domain-mode cluster tests do:

    PUPPET_INSTALL_TYPE=agent \
    BEAKER_PUPPET_COLLECTION=puppet6 \
    BEAKER_set=centos-7-domain-mode-cluster \
    BEAKER_keycloak_domain_mode_cluster=yes \
    BEAKER_destroy=yes \
    pdk bundle exec rspec spec/acceptance/1_domain_mode_cluster_spec.rb

Some tests require you to pass

    BEAKER_keycloak_full=yes

to run, so you may need to add that.

If you want to debug test failures in multi-machine test setup set BEAKER_destroy=no
and login to the container(s) you want to look into:

    $ docker container ls
    $ docker container exec -it keycloak-master-el7

To destroy the containers and start from scratch:

    $ docker container stop $(docker ps -q)
    $ docker prune

Check puppet-module-keycloak/.github/workflows/ci.yaml for a list of
environment variables you can customize.
