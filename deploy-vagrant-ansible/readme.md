

after provisioning the 2 servers ,need to update inventory file with correct ips from terraform output

´´´
sed   "s/web-ip/$(terraform output|grep web| cut -d " " -f 3)/g" inventory
sed   "s/db-ip/$(terraform output|grep db| cut -d " " -f 3)/g" inventory
´´´
dont forget " " for sed command ,with single quotes doesnt allow command $() substitution or variable expansion ${}
