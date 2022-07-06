#!/bin/bash
#
# This script automates the creation of a .bash_aliases file with instructions
# under the user's home directory.

BASH_ALIASES="$HOME/.bash_aliases"
BASH_ALIAS="$HOME/.bash_alias"
BASHRC="$HOME/.bashrc"

# create a .bash_aliases file if it doesn't exist
if [[ ! -f $BASH_ALIAS && ! -f $BASH_ALIASES ]]; then touch $BASH_ALIASES; else exit 0; fi

# create a .bashrc file if it doesn't exist
if [[ ! -f $BASHRC ]]; then touch $BASHRC; fi

# add check to .bashrc file to execute .bash_aliases file
echo -e "\n\n# Aliases\nif [ -f ~/.bash_aliases ]; then\n  . ~/.bash_aliases\nfi\n" >> $BASHRC

# initialize .bash_aliases file with instructions
printf "#########################\n### CREATING AN ALIAS ###\n#########################\n#\n# alias <name of alias>=\"<bash command>\"\n#\n# Example:\n# alias l=\"ls -lah\"\n#\n######################################\n### MULTIPLE ALIASES, SAME COMMAND ###\n######################################\n#\n# alias {<name1>, <name2>, <...>}=\"<bash command>\"\n#\n# Example:\n# alias {l,ll}=\"ls -lah\"\n#\n############################\n### FUNCTIONS AS ALIASES ###\n############################\n#\n# alias <name>='<function_name>() { <logic> }; <call function>'\n#\n# Example:\n# alias md='x(){ mkdir "\$1"; cd \$1; }; x'\n#\n########### OR #############\n#\n# alias <name>='<call function>'\n# <function_name>() {\n#   <logic>   \n# }\n#\n# Example:\n# alias md='x'\n# x() {\n#    mkdir \$1\n#    cd \$1\n# }\n#\n###################################################\n# To apply your aliases, run the following command:\n# source ~/.bashrc\n" >> $BASH_ALIASES

# Tell user script finished
echo "Done! Add aliases under $BASH_ALIASES"