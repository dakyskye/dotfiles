#!/bin/sh

echo "input your actual user account password:"
read -s pass

sed -i '1s/PASSWORD/'$pass'/' ~/.xinitrc
