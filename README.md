# mdstudio_haddock

[![Build Status](https://travis-ci.org/MD-Studio/mdstudio_haddock.svg?branch=master)](https://travis-ci.org/MD-Studio/mdstudio_haddock)
[![Codacy Badge](https://api.codacy.com/project/badge/Grade/45c094619e7d422f8e8245774442e498)](https://www.codacy.com/manual/marcvdijk/MDStudio_haddock?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=MD-Studio/MDStudio_haddock&amp;utm_campaign=Badge_Grade)
[![codecov](https://codecov.io/gh/MD-Studio/MDStudio_haddock/branch/master/graph/badge.svg)](https://codecov.io/gh/MD-Studio/MDStudio_haddock)

![Configuration settings](mdstudio-logo.png)

This repository gathers different interfaces to HADDOCK software (http://www.bonvinlab.org/software/haddock2.2/) developed by 
the group of Prof. dr. Alexandre Bonvin at Utrecht University.

The bridge between your local python script/pipeline and the software is made through an XMLRPC API implemented on the server 
side. By setting up a proper XMLRPC server on the client side, you can expose different methods to interact with HADDOCK and 
its environment.

The different methods exposed through the HADDOCKInterface class and accessible to users (in parenthesis the **minimum access level** required to use the function):

* list_projects() => List all projects of a specific user (**EASY**)
* get_status() => Get status of a specific project (**EASY**)
* get_url() => Get URL of a finished project archive (**EASY**)
* get_params() => Download HADDOCK parameter file for a specific project (**EASY**)
* launch_project() => Run an HADDOCK project from a parameter file (**GURU**)
* list_users() => List all HADDOCK users (output username and email) (**ADMIN**, Alex or Marc)

## Console-like environment

As a proof of concept, we designed a lightweight console-like environment (based on the [cmd2 Python module](https://github.com/python-cmd2/cmd2)) to access the different methods listed above. 

This console allows you to use the login/logout features present in HADDOCKInterface class to avoid the username/password request at each new method usage.
Within the console, all XMLRPC API methods are accessible and some of them have seen their output enhanced through the usage of arguments.

The complete list of commands (including native ones) can be obtained with `help` and each command has a description/usage output with `help command`.

## Installation Quickstart
MDStudio haddock can be used in the MDStudio environment as Docker container or as standalone service.

### Install option 1 Pre-compiled Docker container
MDStudio haddock can be installed quickly from a pre-compiled docker image hosted on DockerHub by:

    docker pull mdstudio/mdstudio_haddock
    docker run (-d) mdstudio/mdstudio_haddock

In this mode you will first need to launch the MDStudio environment itself in order for the MDStudio haddock service to 
connect to it. You can unify this behaviour by adding the MDStudio haddock service to the MDStudio service environment as:

    MDStudio/docker-compose.yml:
        
        services:
           mdstudio_haddock:
              image: mdstudio/mdstudio_haddock
              links:
                - crossbar
              environment:
                - CROSSBAR_HOST=crossbar
              volumes:
                - ${WORKDIR}/mdstudio_haddock:/tmp/mdstudio/mdstudio_haddock

And optionally add `mdstudio_haddock` to MDStudio/core/auth/settings.dev.yml for automatic authentication and 
authorization at startup.

### Install option 2 custom build Docker container
You can custom build the MDStudio haddock Docker container by cloning the MDStudio_haddock GitHub repository and run:

    docker build MDStudio_haddock/ -t mdstudio/mdstudio_haddock
    
After successful build of the container follow the steps starting from `docker run` in install option 1.

### Install option 3 standalone deployment of the service
If you prefer a custom installation over a (pre-)build docker container you can clone the MDStudio_haddock GitHub
repository and install `mdstudio_haddock` locally as:

    pip install (-e) mdstudio_haddock/

Followed by:

    ./entry_point_mdstudio_haddock.sh
    
or

    export MD_CONFIG_ENVIRONMENTS=dev,docker
    python -u -m mdstudio_haddock

## Acknowledgment

This project has been developed in the Computational Structural Biology group of Utrecht University.
Main development has been made by Mikael Trellet (mikael.trellet@gmail.com) for the python interfaces at the client side linking the work made by Marc van Dijk (m4.van.dijk@vu.nl) for the XMLRPC API on the server side.
