source common.sh

echo -e "${color}Copying repo${nocolor}"
cp /home/centos/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo &>>${logfile}
status $?
echo -e "${color}Installing Mongodb Server${nocolor}"
yum install mongodb-org -y &>>${logfile}
status $?
echo -e "${color}Configuring localhost File${nocolor}"
 &>>${logfile}
status $?
echo -e "${color}Enabling and restarting Mongodb Server${nocolor}"
systemctl enable mongod &>>${logfile}
status $?
systemctl restart mongod