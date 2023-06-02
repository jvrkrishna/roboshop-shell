component=mysqld
source common.sh

echo -e "${color}Disable pre-module Server${nocolor}"
yum module disable mysql -y &>>${logfile}
status $?
echo -e "${color}copy mysql repo${nocolor}"
cp /home/centos/roboshop-shell/mysql.repo  /etc/yum.repos.d/mysql.repo &>>${logfile}
status $?
echo -e "${color}Installing mysql server${nocolor}"
yum install mysql-community-server -y &>>${logfile}
status $?
service_start
echo -e "${color}Securing installation for mysql${nocolor}"
mysql_secure_installation --set-root-pass RoboShop@1 &>>${logfile}
status $?
echo -e "${color}Just trying to login with username and password${nocolor}"
mysql -uroot -pRoboShop@1 &>>${logfile}
status $?