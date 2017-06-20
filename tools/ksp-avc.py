#!/usr/bin/env python

import sys

content = '{\n' + \
'  "NAME": "NameTag",\n' + \
'  "URL": "http://ksp-avc.cybutek.net/version.php?id=344",\n' + \
'  "DOWNLOAD": "https://github.com/krpc/NameTag/releases/latest",\n' + \
'  "VERSION": { "MAJOR": %d, "MINOR": %d, "PATCH": %d },\n' + \
'  "KSP_VERSION": { "MAJOR": %d, "MINOR": %d, "PATCH": %d }\n' + \
'}'

version_parts = sys.argv[1].split('.')
ksp_version_parts = sys.argv[2].split('.')
print(content % tuple(int(x) for x in version_parts + ksp_version_parts))
