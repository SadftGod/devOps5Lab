aws ec2 run-instances --image-id ami-053b0d53c279acc90 --count 1 --instance-type t2.micro --key-name nevada --security-group-ids sg-07e3df452e3270e81 --subnet-id subnet-0b9adc53bfa8dde31 --user-data file://./coder.sh

ssh -i nevada.pem ubuntu@3.95.225.185

systemctl status no_virus.service

echo "yes, pls ,I need it" > /tmp/from/test.txt

ls /tmp/to
