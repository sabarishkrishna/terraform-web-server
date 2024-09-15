#!/bin/bash
apt update -y
apt install apache2 -y
service start apache2
service enable apache2