# AlexUnderGo_infra
AlexUnderGo Infra repository
#Домашнее задание №3
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

#Домашнее задание №4
#Деплой тестового приложения
Данные для проверки:
testapp_IP = 51.250.89.168
testapp_port = 9292

#Дополнительное задание
Создан скрипт install_all.sh для автоматической установки и деплоя приложения.
#Для себя
В папке /tmp создан скрип для автоматического развертывания виртуальной машины в YC и установки утилит+развертывания деплоя.


#Домашнее задание №5
Выполнено:
Параметризирование шаблона
Использованы другие оп Другие опции билдера
*Построение bake-образа
*Автоматизация создания ВМ

#Домашнее задание №6
Выполнено:
Определите input переменную для приватного ключа,
использующегося в определении подключения для
провижинеров (connection);

Определите input переменную для задания зоны в ресурсе
"yandex_compute_instance" "app". У нее должно быть значение
по умолчанию;

Отформатируйте все конфигурационные файлы используя
команду terraform fmt;

Создан файл terraform.tfvars.example, в
котором указаны переменные для образца.

**Создан балансировщик lb.tf
**Созданы инстансы через Count

#Домашнее задание №7
1.Удалены из папки terraform файлы main.tf, outputs.tf,
terraform.tfvars, variables.tf, так как они теперь перенесены
в stage и prod
2.Параметризирована конфигурация модулей
нужным
3.Отформатированы конфигурационные файлы, используя команду
terraform fmt

*
1.Настроено храниение стрейт файла в удаленном бекенде для stage и prod, использован Yandex Object Stprage в качестве бекенда.
Описание бекенда вынесено в файл beckend.tf
2.Terraform видит текущее состояние, если перенести конфигурационные файлы.
3.Проверена работа блокировок при одновременном запуске.
4.Добавлено описание.

**
1.Добавлены необходимые provisioner в модули для деплоя и работы приложения. Файлы находятся в директории модуля.
2.Отключение provisioner не реализовано.
3.Добавлено описание.
