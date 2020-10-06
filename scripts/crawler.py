#! /usr/bin/env python3
import argparse
import os
import subprocess
import re

parser = argparse.ArgumentParser(description='''
    Script to apply commands to all files in directory. The directory will be recursively walked and the command applied to all files found. Optional arguments allow for filtering
''')
parser.add_argument("--start_dir", "-d", 
    help="Directory to search. Default is current directory",
    default=".")
parser.add_argument("--cmd", "-c",
        help="Command to execute on each item found in the search. Default is 'ls'",
        default="ls")
parser.add_argument("--file_filter", "-f",
        help="Regular expression filter to apply. Command will only be applied to matching files.")
parser.add_argument("--file_suffix", "-s", 
        help="File suffix filter to apply. Command will apply only to files ending in this suffix.")

args = parser.parse_args()
start_dir = args.start_dir
cmd = args.cmd
file_filter = args.file_filter
file_suffix = args.file_suffix

all_cmds = []

#Initialize filters
if file_filter != None:
    regex = re.compile(file_filter)
if file_suffix != None:
    suffix_pattern = ".*" + file_suffix + "$"
    suffix = re.compile(suffix_pattern)

for root, dirs, files in os.walk(start_dir):
    for name in files:
        # Check filters
        if file_filter != None and not re.match(regex, name):
            continue
        if file_suffix != None and not re.match(suffix, name):
            continue
        # Parse command and execute
        full_file = os.path.join(root, name)
        cmd_array = cmd.split(" ")
        cmd_array.append(full_file)
        subprocess.call(cmd_array)
        all_cmds.append(cmd_array)

#Print summary
print("Commands executed:")
for cmd in all_cmds:
    print (" ".join(cmd))
