#!/bin/bash
tsh ls | grep -Eo 'hostname='$1'[^ ,]+' | sed 's/hostname=//g' > host.txt