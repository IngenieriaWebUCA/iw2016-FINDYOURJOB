#!bin/sh
echo 
echo "**********    Script instalacion findyourjob **********"
echo 
read -p "Introduzca usuario Mysql: " USER
read -p "Introduzca password Mysql: " PASS

mysql --user="$USER" --password="$PASS" < findyourjob.sql

echo "Puede acceder a la aplicación una vez termine de desplegarse en el servidor, mediante la URL:"
echo "- http://localhost:8080/findyourjob/"
read -p "Pulse intro para continuar..."

mvn clean compile tomcat7:run 