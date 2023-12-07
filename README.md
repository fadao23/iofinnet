# IO.FINNET - CHALLANGE DEVSECOPS

This repo containes 2 directories, one for Terraform and another one for Asnible. In each folder you'll find README.md file at the root.

## Terraform

Scenario:

A project aims to deploy a web application infrastructure on AWS through Terraform. This application requires setups across three distinct environments: development, staging, and production. Your challenge involves crafting Terraform code that fulfills the given criteria, while maintaining industry best practices in security, scalability, and code structure.

## Ansible

The solution has been tested on Ubuntu 22.04. Ideally will work on all apt compatible systems, but i've decided to fail if the OS version is different, due to the (possible) different packages naming.
The playbook is made of 2 roles (**app** and **docker**) with dependency (**app** explicitly require docker **docker**).
Among all the steps, 3 doesn't pass the lint, but i left them despite not consider best practice as they simplify the role and the code quite a lot.