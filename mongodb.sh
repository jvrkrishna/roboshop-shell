component=mongod
source common.sh

echo -e "${color}Copying repo${nocolor}"
cp /home/centos/roboshop-shell/mongo.repo /etc/yum.repos.d/mongo.repo &>>${logfile}
status $?
echo -e "${color}Installing Mongodb Server${nocolor}"
yum install mongodb-org -y &>>${logfile}
status $?
echo -e "${color}Configuring localhost File${nocolor}"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf&>>${logfile}
status $?
echo -e "${color}Enabling and restarting the service${nocolor}"
systemctl enable mongod
systemctl restart mongod
status $?
