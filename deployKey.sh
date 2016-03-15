#!/bin/bash
cd /tmp
# create hosts
echo itClassroom01 > hosts
echo itClassroom02 > hosts
echo itClassroom03 > hosts
echo itClassroom04 > hosts
echo itClassroom05 > hosts
echo itClassroom06 > hosts
echo itClassroom07 > hosts
echo itClassroom08 > hosts
echo itClassroom09 > hosts
echo itClassroom10 > hosts
echo itClassroom11 > hosts
echo itClassroom12 > hosts
echo itClassroom13 > hosts
echo itClassroom14 > hosts
echo itClassroom15 > hosts
echo itClassroom16 > hosts
echo itClassroom17 > hosts
echo itClassroom18 > hosts



# grab IP addresses from hosts
for node in $(cat hosts); do
  nslookup $node | grep 'Address\:' | awk 'NR==2 {print $2}' >> hosts
done

# add ssh keys for both hostname and ip for each host
for node in $(cat hosts); do
  ssh-keyscan -H $node >> ~/.ssh/known_hosts
  ssh-copy-id -i ~/.ssh/remote pi@$node

done

# Cleanup known_hosts for duplicate entries
sort -u ~/.ssh/known_hosts > ~/.ssh/known_hosts.clean
mv ~/.ssh/known_hosts ~/.ssh/known_hosts.backup
cp ~/.ssh/known_hosts.clean ~/.ssh/known_hosts

# make sure destination exists and is writable for rundeck user... This was erroring out with permission denied for rundeck user.
#sudo mkdir /var/lib/rundeck/.ansible/
#sudo chown -R rundeck:rundeck /var/lib/rundeck/.ansible/
#cd /tmp/ansible
#ansible-playbook -i hosts ansible-test.yml --user rundeck
