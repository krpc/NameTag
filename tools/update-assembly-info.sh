#!/bin/bash

printf "using System.Reflection;\n\n[assembly: AssemblyTitle (\"NameTag\")]\n[assembly: AssemblyVersion (\"`tools/version.sh`\")]\n" >src/AssemblyInfo.cs
