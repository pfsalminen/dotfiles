#!/ust/bin/env python3
# -*- coding:utf-8 -*-

'''Paul Salminen 2018 paulsalminen@gmail.com
Python Scripy to load all dotfiles in dotfiles repo with git stow
'''

import os

progs = os.listdir()
for prog in progs:
    os.system(f'stow {prog}')
