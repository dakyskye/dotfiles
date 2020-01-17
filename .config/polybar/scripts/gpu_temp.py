#!/usr/bin/python

# custom script that only works for my case
# when output of "sensors" command is:

#nouveau-pci-0600
#Adapter: PCI adapter
#fan1:           0 RPM
#temp1:        +72.0°C  (high = +95.0°C, hyst =  +3.0°C)
#                       (crit = +105.0°C, hyst =  +5.0°C)
#                       (emerg = +135.0°C, hyst = +10.0°C)
#
#acpitz-acpi-0
#Adapter: ACPI interface
#temp1:        +16.8°C  (crit = +20.8°C)
#
#k10temp-pci-00c3
#Adapter: PCI adapter
#Tdie:         +47.2°C  (high = +70.0°C)
#Tctl:         +47.2°C 

import os
import re

pattern = r"temp1:.*(\+.*).*\("
out = os.popen('sensors').read()

matches = re.search(pattern, out)

if not matches:
    print("unavailable")
    exit()

print(matches.group().split()[1].strip())
