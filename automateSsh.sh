# Automate the generation and distribution of keys
# https://www.ibm.com/developerworks/community/blogs/kevgrig/entry/automating_server_administration_with_ssh_keys?lang=en
#
mkdir ~/.ssh
mkdir ~/.ssh && chmod 700 ~/.ssh && cd ~/.ssh/
ssh-keygen -t rsa -b 4096 -f ~/.ssh/remote
ssh-copy-id -i ~/.ssh/remote user@host
ssh-add ~/.ssh/remote
