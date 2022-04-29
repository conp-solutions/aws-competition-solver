#!/bin/bash

# MergeSat, ignore host file, just consume input file

# Rn on formula (parameter $2), with half the available cores
mergesat "$2" -no-model -cores=-2

exit 0
