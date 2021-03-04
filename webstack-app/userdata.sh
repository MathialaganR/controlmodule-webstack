#!/bin/bash
#
# Set hostname
#
hostnamectl set-hostname ${appliedhostname}

#
# Patch
#
yum update -y

