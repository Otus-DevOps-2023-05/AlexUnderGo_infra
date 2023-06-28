# AlexUnderGo_infra
AlexUnderGo Infra repository

#Самостоятельное задание
Исследовать способ подключения к someinternalhost в одну
команду из вашего рабочего устройства, проверить работоспособность
найденного решения -
#IP addres bastion&someinternalhost на момент написания
ssh -i ~/.ssh/id_rsa_yandex -J 158.160.33.197 alex@10.128.0.15

#Дополнительное задание:
Предложить вариант решения для подключения из консоли при помощи
команды вида ssh someinternalhost из локальной консоли рабочего
устройства, чтобы подключение выполнялось по алиасу
someinternalhost -
Создать на локальном компьютере и настроить свой ~/.ssh/config следующего содержания:

Host bastion
HostName 51.250.93.42
#Путь к закрытому ключу, с которым подключаемся на удаленную машину
IdentityFile ~/.ssh/id_rsa_yandex
User alex
Host someinternalhost
HostName 10.128.0.15
User alex
ProxyCommand ssh -W %h:%p bastion

После этого, можно подключаться строкой вида - ssh someinternalhost/ssh bastion

#Установка pritunl
Установлен скриптом setupvpn.sh (переделаный под ubuntu 22.04).
bastion_IP = 51.250.93.42
someinternalhost_IP = 10.128.0.15

#Домашняя работа к уроку №6
#Деплой тестового приложения
testapp_IP = 51.250.89.168
testapp_port = 9292

#Дополнительное задание
Создан скрипт install_all.sh для автоматической установки и деплоя приложения.
#Для себя
В папке /tmp создан скрип для автоматического развертывания виртуальной машины в YC и установки утилит+развертывания деплоя.
