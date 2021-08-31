
====================================================
SCP COMMAND TO UPLOAD FILE TO REMOTE HOST
====================================================


scp 1000_orders.json student782_13@10.0.0.19:/home/student782_13/

scp orders_data_uploader.py student782_13@10.0.0.19:/home/student782_13/ 





====================================================
UNRAR FILE
====================================================


sudo apt install unrar
unrar e file.rar




====================================================
ПРОВЕРКА МЕСТА
====================================================

apt-get install ncdu





ls - список файлов в директории;
cd - переход между директориями;
rm - удалить файл;
rmdir - удалить папку;
mv - переместить файл;

mv file newfile - переименовать файл

cp - скопировать файл;
mkdir - создать папку;
ln - создать ссылку;
chmod - изменить права файла;
touch - создать пустой файл.






====================================================
 //////////////////////// ЗАНЯТИЕ 3 ///////////////
====================================================

Файл /etc/passwd. Предназначен для хранения списка учётных записей
Файл /etc/group хранит информацию о группах и пользователях

Файл /etc/shadow хранит информацию о паролях пользователей из файла etc/passwd
Файл изменяется командой passwd.

useradd -s /bin/bash -d /home/user -m user_name
adduser

groupadd group_name
adduser username --gid GID , adduser user1 --gid 1001

deluser
delgroup
groupdel


Изменение параметров пользователя
passwd user_name изменит пароль пользователя
passwd без указания пользователя изменит или задаст пароль текущему пользователю
chage user_name позволит изменить политики паролей (sudo)
usermod изменяет атрибуты пользователя

sudo usermod -aG spb_office petro - сменить группу
sudo usermod -g petro petro сменить группe по умолчснию

sudo deluser petro spb_office - удаление из группы


usermod -aG sudo user_name , где параметр -G — имя дополнительной группы,
а параметр -a добавляет пользователя в дополнительные группы


создание SUDOERA
sudo useradd -m -G sudo anna
sudo passwd anna


whoami - кто я?


sudo chage -l nina - посомтреть параметры пароля
id - все параметры


Временно стать супер пользователем
sudo -s
sudo -i


Если несколько админов
sudo visudo
================================
=============================================================
РЕШЕНИЕ ЗАДАЧИ 4
=============================================================================================
азрешение пользователю выполнять команду без ввода пароля
Для того, что бы система не запрашивала пароль при определенных командах необходимо в sudoers после строки # Cmnd alias specification добавить строку, где через запятую перечислить желаемые команды с полным путём(путь команды можно узнать, выполнив which имя_команды:

# Cmnd alias specification
Cmnd_Alias SHUTDOWN_CMDS = /sbin/shutdown, /usr/sbin/pm-hibernate, /sbin/reboot
И в конец файла дописать строку

имя_пользователя ALL=(ALL) NOPASSWD: SHUTDOWN_CMDS








====================================================
 //////////////////////// ЗАНЯТИЕ 4 ///////////////
====================================================


ps ef - все процессы со атрибутами

ps u - расширенный способ вывода
ps ux - расширенный способ вывода процессов отсоединенных от терминала - в фоновом режиме и ничего в консоль не выводят

sudo apt install htop - консольная версия Диспетчера задач





systemctl - управляет systemd
man systemctl - справка

q - ВЫХОД

systemctl [start|stop|status|restart|reload] service_name позволит 
запустить службу (start), 
остановить (stop), 
получить информацию о службе (status), 
перезапустить службу (restart), 
перечитать конфигурационный файл службы (reload).


-------------------------------------------------
Убить процесс
-------------------------------------------------

kill PID  или PPID или сигнал (SIGKILL - 9 - безусловное 'завершение' SIGSTOP-23 - 'остановка')

kill - 15 - SIGTERM корректное завершение 

kill -l - посмотреть все сигналы процессу

kill - вообще  - средтсво упралвения процессом

ls |wc -l — команда ls выполнит 'листинг' содержимого и вместо вывода данных на экран 
отправит её на ввод команде wc -l, которая подсчитает количество строк в листинге.

-------------------------------------------------
Мониторинг
-------------------------------------------------
ps  grep - вывод процессов по поисковому шаблону

top (table of process) выведет список и информацию о запущенных в системе процессах - как Диспетчер ЗАДАЧИ

df покажет размер, занятое и свободное пространство 

-------------------------------------------------
ЛОГИ
-------------------------------------------------
/var/log

journalctl

journalctl -u sshd 


-------------------------------------------------
PIPELINE КОНВЕЕР
-------------------------------------------------

Пример конвеера между процессами - от ls  в grep передается поиск 

 ls -l | grep \.txt

 cat ./* - прочитать содержимое всех каталогов

 cat ./* 2>error.log 1>result.log
 cat error.log
 cat result.log

 ----- объединить -----
 cat ./* 2>&1> result.log

 cat ./* 2>&1 | tee 2file.txt - передать процессу tee  и объединить с выводом и записью оновременно



<file
>file
0 - STDIN
1 - STDOUT
2 - STDERR

http://xgu.ru/wiki/%D0%A1%D1%82%D0%B0%D0%BD%D0%B4%D0%B0%D1%80%D1%82%D0%BD%D1%8B%D0%B5_%D0%BF%D0%BE%D1%82%D0%BE%D0%BA%D0%B8_%D0%B2%D0%B2%D0%BE%D0%B4%D0%B0/%D0%B2%D1%8B%D0%B2%D0%BE%D0%B4%D0%B0

2>> - пененаправление ошибок

2>&1 - перенаправление и ошибок и вывода



apt install apache2 - установка сервера апач



sudo systemctl status apache2.service - рповерка запуска службы

sudo systemctl stop apache2.service - остановка службы

 sudo systemctl restart apache2.service - перезапуск службы

 sudo systemctl disable apache2.service - удаляет из автозагрунзки

sudo systemctl enable apache2.service - наоборот



sudo systemctl list-units --state=active





--главная страница после утсановки
/var/www/html/index.html

-- мануал полный
/usr/share/doc/apache2/README.Debian.gz




-- конфигурационная структура

/etc/apache2/
|-- apache2.conf
|       `--  ports.conf
|-- mods-enabled
|       |-- *.load
|       `-- *.conf
|-- conf-enabled
|       `-- *.conf
|-- sites-enabled
|       `-- *.conf



====================================================
 //////////////////////// ЗАНЯТИЕ 5 ///////////////
====================================================





sudo apt install tree -y - древовидная структура
tree - d


nano /etc/fstab - UID дисск и все точки монтирования

ls -li - посмотреть inodы

Права доступа можно представить в численном виде, используя восьмеричную систему счисления, согласно таблице:

UUU - владелец
GGG - группа
OOO - остальные

DD UUU GGG OOO

	r	w	x		r	w	x		
– 	– 	– 	– 		0	0	0		0
x	– 	–	x		0	0	1		1
w	–	w	–		0	1	0		2
wx	–	w	x		0	1	1		3
r	r	–	–		1	0	0		4
rx	r	–	x		1	0	1		5
rw	r	w	–		1	1	0		6
rwx	r	w	x		1	1	1		7

chmod u+x file

chmod g-w file

Chmod -R 655 dir1 - рекурсивно)

chmod 766 file (или каталог)

______________
БИТЫ


SUID - ФАЙЛЫ Разрешает пользователям запускать файл на исполнение с правами того пользователя, которому принадлежит данный файл.
chmod u+s file
chmod 4755 file

SGID - устанавливает 'идентификатор группы каталога', "а не группы владельца", который создал файл в этом каталоге.
chmod g+s dir1
chmod 2665 dir1

Sticky - Файлы из каталога с таким битом может удалить только владелец
chmod +t dir1
chmod 1666 dir1




====================================================
 //////////////////////// ЗАНЯТИЕ 6 ///////////////
====================================================

echo $? - посмотреть код завершения последнего процессами


______________
ПЕРЕМЕННЫЕ ОКРУДЕНИЯ


echo $PWD

echo $SHELL


sudo apt update && sudo apt full-upgrade - ЛОНИЧЕСКИЕ 'И'

sudo apt update ||  apt full-upgrade ||  ls tesdir - РАЗДЕЛИТЕЛЬНОЕ ИЛИ ИЛИ ИСКЛЮЧАЮЩЕЕ ИЛИ

apt update ;  sudo  apt full-upgrade ;  ls tesdir - БЕЗУСЛОВНОЕ ВЫПОЛНЕНИЕ НЕ ЗАВИСИМО  - ВСЕ ВЫПОЛНИТСЯ


-m - выполнить и закрыть скрирт

-f прочитать и ожидать ввод новой строки

Ctlt + C - ПРЕРВАТЬ СКРИПТ

___________________________
ПЛАНИРОВЩИКИ

sudo apt install at -y - установка AT


sudo crontab -u root -e - открыть crontab root на редактирование

crontab -l - просмотреть




====================================================
 //////////////////////// ЗАНЯТИЕ 7 ///////////////
====================================================

Добавление репозитория через редактирование файла /etc/apt/source.list
В текстовом редакторе открываем файл /etc/apt/source.list и в конце файла вводим строку вида:
deb http://адрес _ репозитория версия _ дистрибутива ветки

Например, добавим репозиторий nginx, для этого создадим в каталоге /etc/apt/source.list.d/ файл
nginx.list следующего содержания:
deb http: // nginx.org /packages/ubun tu bionic nginx

curl -fsSL https ://nginx.org/ keys /nginx_signing.key | sudo apt-key add - - добавление ключа

apt install nginx -y  - установка


apt- add -repository pp a:nginx /stable - другой способ добавления репозитория ерез apt

cat /etc/apt/sources .list.d /nginx-ubuntu-stable-bionic .list
"deb http://ppa.launchpad.net/nginx/stable/ubuntu bionic main"
____________________
Управление пакетами

apt

apt search package_name — поиск пакета;
● apt show package_name — посмотреть информацию о пакете;
● apt install package_name -y — установить пакет;
© geekbrains.ru 4
● apt install package_name1 package_name2 -y — установить два пакета;
● apt remove package_name — удалить пакет, при этом сохранятся файлы с настройками;
● apt purge package_name — полностью удалить пакет, включая конфигурационные файлы;
● apt upgrade — обновить все установленные пакеты;
● apt update — обновить информацию о пакетах в репозиториях, указанных в настройках



dpkg - ограниченный фукнуционал, чтолько окальыне пакеты


● dpkg -l — просмотр списка пакетов;
● dpkg -i package_name — установить пакет или группу пакетов;
● dpkg -r package_name — удалить пакет или группу пакетов.



snap - все данные и зависимости

● snap search package_name — поиск пакета;
● snap install package_name — установка пакета;
● snap refresh package_name — обновление пакета;
● snap remove package_name — удаление пакета;
● snap list — просмотр установленных пакетов.



+++++++++++++++++++++++++++++++++++++++++
СЕТЕВАЯ БЕЗОПАСНОСТЬ
+++++++++++++++++++++++++++++++++++++++++

iptables  - настрокйи/ политики


Политики для цепочки устанавливаются следующим образом:

iptables -P имя _ цепочки -j Действие

iptables -P INPUT -j ACCEPT - разрешение всего входящего трафика

iptables -A имя_цепочки -p протокол --dport порт -j действие - правило делется так

iptables -A INPUT -p tcp --dport 80 -j ACCEPT -  - разрешающее подключения по протоколу TCP на порт
80 нашего сервера.


iptables -A INPUT -p tcp -s 192.168.0.100 --dport 80 -j DROP -  запретим все подключения по протоколу TCP, исходящие соединения от хоста с
 - IP-адресом 192.168.0.100 на порт 80 нашего сервера

===============================================
 nat: - ПРОБРОС ПОРТОВ
===============================================


 sudo sysctl -w net.ipv4.ip_forward=1 -  вкчаетм передаресацию на уровне ядра  - меняется параметр net.ipv4.ip_forward на 1:

 iptables -A FORWARD -j ACCEPT  - уюедиться что водиящий траик политика ACCEPT


iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to-destination 10.0.0.2 - проброс входящ на 80 внутрь на 10.0.0.2


iptables -t nat -A PREROUTING -p tcp --dport 80 -j REDIRECT --to-port 8080 - проброс порт вход с 80порта на 8080 нашего

iptables -t nat -A POSTROUTING -o eth1 -p tcp --dport 80 -d 10.0.0.2 -j SNAT --to-source 10.0.0.1 - мод IP источника на IP маршрутизатора


ПРОСМОТР ПРАВИЛ

iptables -t имя _ таблицы -L - правила в таблице

iptables -L - по умолчанию в таблице filter

iptables -t nat -L - праила в таблице nat





ДАМП СОХРАНЕНИЕ И ВОССТАНОВЛЕНИЕ

iptables-save - дамп правил


iptables-save > iptables.bk

iptables-restore: iptables-restore<iptables.bk

------------------------------------------

firewalld - РАБОТАТЬ ПО НЕМУ

------------------------------------------

root@ubuntu:~# apt install firewalld - установка более удобной утилиты по нтсройке правил

root@ubuntu:~# firewall-cmd --get-active-zones
public
  interfaces: ens33



root@ubuntu:~# nano /etc/firewalld/firewalld.conf -  проверить настройки утилиты

root@ubuntu:~# firewall-cmd --list-all - параметры посмотреть 



------------------------------------------
DOCKER
------------------------------------------

docker ps -a  статус всех контекнеров - запущен, покинуит

docker start centos01 либо имя контейнера либо id -перезапустить конейнер

docker exec -it ....id кониейнера.... bash - запустить конейнер ubuntu

docker diff  ...id кониейнера.... - состояние контейнера - истори изменения файлов 

docker stop ...id кониейнера.... ...id кониейнера.... ...id кониейнера.... - остановить

docker rm  ...id кониейнера... - удалить



------------------------------------------
DOCKER COMPOSE
------------------------------------------

создать папку /docker

перейти и создать yaml файл docker-compose.yml

После установки - создать yaml файл с сборкой:

...

version: '3.1'

services:

  db:
    image: mariadb
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: 12345
    volumes:
      - ./dbs:/var/lib/mysql

  adminer:
    image: adminer
    restart: always
    ports:
      - 6090:8080




...

ЗАПУСТИТЬ УСТАНОВКУ - НАЧЕНТСЯ СКАЧИВАНИЕ  И УСТАНОВКА СБОРКИ

do docker-compose up -d


http://10.128.200.22:6090/ - Adminer


docker logs 





sudo du -sm * | sort -n - ПОСМОТРЕТь ОБЪЕМ ЗАНИМАЕМОГО МЕСТА

sudo apt-get autoremove - чистка кэша

sudo docker-compose down -v - удалить все


00000000000000000000000000000000000000000000000000000000000000000000000000
УВЕЛИИТЬ ДИСК ПОСЛЕ ОБАВЛЕНИЕ ЕГО В ВИРТУАЛЬНОЙ МАШИНЕ
00000000000000000000000000000000000000000000000000000000000000000000000000



sudo echo "1" > /sys/class/block/sda/device/rescan 
bash: /sys/class/block/sda/device/rescan: Permission denied
andrey@ubuntu:~$ sudo -i
root@ubuntu:~# echo "1"> /sys/class/block/sda/device/rescan
root@ubuntu:~# 
root@ubuntu:~# fdisk -l /dev/sda


00000000000000000000000000000000000000000000000000000000000000000000000000
ОЧИСТКА ЖУРНАЛА
00000000000000000000000000000000000000000000000000000000000000000000000000
journalctl --disk-usage


sudo journalctl --vacuum-size=50M - очистка журнала
journalctl --verify

journalctl --disk-usage - прверяем итог


Linux - как почистить логи /var/log/journal/
директория /var/log/journal - стала заниматься слишком много места и ее нужно очистить:

953M /var/log/journal
До очистки:

# journalctl --disk-usage
Archived and active journals take up 952.2M on disk.
Делаем чистку:

# journalctl --vacuum-size=50M
# journalctl --verify
После очистки получаем результат:

# journalctl --disk-usage
Archived and active journals take up 56.0M on disk.

Меняем конфиг:

# vi /etc/systemd/journald.conf
SystemMaxUse=50M
SystemMaxFileSize=12M
# systemctl restart systemd-journald

00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000
-- POSTGRESQL --
00000000000000000000000000000000000000000000000000000000000000000000000000

Ver Cluster Port Status Owner    Data directory              Log file
13  main    5432 down   postgres /var/lib/postgresql/13/main /var/log/postgresql/postgresql-13-main.log



13  main    5432 down   postgres /var/lib/postgresql/13/main /var/log/postgresql/postgresql-13-main.log



ПЕРЕКЛЮЧИТЬСЯ 
andrey@ubuntu:~$ sudo -i -u postgres

или

postgres@ubuntu:~$ sudo -u postgres psql - ЗАХОДИТЬ ИМЕННО ТАК


ИЛИ ТАК
solopharm@solopharmdwh:~$ psql -U postgres -h localhost
Password for user postgres:
psql (13.1 (Ubuntu 13.1-1.pgdg20.04+1))
SSL connection (protocol: TLSv1.3, cipher: TLS_AES_256_GCM_SHA384, bits: 256, compression: off)
Type "help" for help.

postgres=#



ПОДКЛЮЧИТЬСЯ К БАЗЕ

postgres=# \conninfo


 database "postgres" as user "postgres"



СОЗДАЕМ СУПЕРПОЛЬЗОВАТЕЛЯ 

andrey@ubuntu:~$ sudo -u postgres createuser --interactive
Enter name of role to add: solopharmdwh
Shall the new role be a superuser? (y/n) y
andrey@ubuntu:~$


ЗАЙТИ В POSTGRESS И ЗАДАТЬ ПАРОЛЬ

postgress# ALTER USER postgres PASSWORD '1q2w3e4r5T'



СОЗДАЕМ БАЗУ
andrey@ubuntu:~$ sudo -u postgres createdb solopharmdwh


ВХОД В СЛУЖБУ

ПЕРЕД ЭТИМ СДЕЛДАТЬ ПАРОЛЬ НА postgres стандартными средствами

andrey@ubuntu:~$ psql -U postgres -h solopharmdwh

postgres=# \l - список баз данных





andrey@ubuntu:/etc/postgresql/13/main$

насктройка файлов конфигов


service postgresql restart

00000000000000000000000000000000000000000000000000000000000000000000000000
НАСТРОЙКА ПОРТОВ
00000000000000000000000000000000000000000000000000000000000000000000000000


----------------------------------------------------------------------------
прописать порт в firewalld
----------------------------------------------------------------------------

andrey@ubuntu:~$ sudo firewall-cmd --permanent --add-port=5432/tcp


sudo ufw disable - отключение файлрфола firewall

sudo systemctl stop firewalld - отключение файлрфола firewalld


postgres=# \du - список юзеров
                                   List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 andrey    | Superuser, Create role, Create DB                          | {}
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
 ubuntu    | Superuser, Create role, Create DB                          | {}



СОЗДАТЬ НОВОГО ПОЛЬЗОВАТЛЕЯ С правами
______________________________________________________________________________________

postgres=# CREATE USER irina WITH CREATEDB LOGIN ENCRYPTED PASSWORD 'admin';
CREATE ROLE


ДАТЬ ПРАВА НА БАЗУ
______________________________________________________________________________________

postgres=# GRANT ALL PRIVILEGES ON DATABASE codingpub to irina;
GRANT
postgres=#


ДАЛЕЕ ДАТЬ ПРАВА НА ВСЕ ТАБЛИЦЫ
______________________________________________________________________________________
postgres=# \c oleg_test
You are now connected to database "oleg_test" as user "postgres".
oleg_test=# GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO "ponamarenko";
GRANT
oleg_test=#


ПРОВЕРИТЬ ПРАВА КОНКРЕТНОГО ПОЛЬЗОВАТЛЕЯ
______________________________________________________________________________________

SELECT table_catalog, table_schema, table_name, privilege_type
FROM information_schema.table_privileges
WHERE grantee = 'victor_test';


00000000000000000000000000000000000000000000000000000000000000000000000000
РЕМОНТ ПРОГРАММ ПЛОХО УСТАНОВДЕННЫХ
00000000000000000000000000000000000000000000000000000000000000000000000000


sudo apt --fix-broken install



MAC-адрес Текущее состояние Пакетов получено  Пакетов отправлено  SSID
1 E0:CC:F8:DB:4B:4E Подключено  11,468  48,572  MOROZOV - Xiaomi
2 24:18:1D:0F:5A:2D Подключено  36,955  73,054  MOROZOV - S7
3 A4:30:7A:65:74:51 Подключено  17,400  20,161  MOROZOV
4 08:ED:B9:25:FE:68 Подключено  1,913,281 1,275,359 MOROZOV - подозрительный, отключен
5 24:E3:14:01:A1:66 Подключено  2,131 2,576 MOROZOV
6 1C:1B:B5:63:21:C1 - ноутбук




00000000000000000000000000000000000000000000000000000000000000000000000000

REDIS - ДОСТУП НА ВЕРВЕР 6379 порт
00000000000000000000000000000000000000000000000000000000000000000000000000

redis-cli - вход после утсановки

exit - рабтаем под клиентом redis

redis-benchmark -n 100000 - проверка работы производитлености серквера

+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
HELP ПО REDIS
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

root@ubuntu:/etc/redis# redis-cli
127.0.0.1:6379> HELP PING

  PING [message]
  summary: Ping the server
  since: 1.0.0
  group: connection

127.0.0.1:6379>

 _______________________________________________________________________________________
|ЗАПИСЬ ДАННЫХ
|______________________________________________________________________________________

root@ubuntu:/etc/redis# redis-cli
127.0.0.1:6379> SET key 'Hello World!!!'
OK


ВСЕ ВЫСТАВЛЕННЫЕ СОЕДИНЕНИЯ

netstat -tulpan




ПРОВЕРКА СОКРОСТИ СЕТЕВОГО АДАПТЕРА

iconfig - смотрим наименвоание

ethtool eno1 - запускаем утилиту с анименвоанием девайса

solopharm@solopharmdwh:~$ ethtool eno1
Settings for eno1:
        Supported ports: [ TP ]
        Supported link modes:   10baseT/Half 10baseT/Full
                                100baseT/Half 100baseT/Full
                                1000baseT/Full
        Supported pause frame use: No
        Supports auto-negotiation: Yes
        Supported FEC modes: Not reported
        Advertised link modes:  10baseT/Half 10baseT/Full
                                100baseT/Half 100baseT/Full
                                1000baseT/Full
        Advertised pause frame use: No
        Advertised auto-negotiation: Yes
        Advertised FEC modes: Not reported
        Speed: 1000Mb/s
        Duplex: Full
        Port: Twisted Pair
        PHYAD: 1
        Transceiver: internal
        Auto-negotiation: on
        MDI-X: on (auto)
Cannot get wake-on-lan settings: Operation not permitted
        Current message level: 0x00000007 (7)
                               drv probe link



_____________________________________________________________________________________
КОНТРОЛЬ ВХОДОВ ВСЕХ НЕУСПЕШНЫХ
_____________________________________________________________________________________

journalctl _SYSTEMD_UNIT=ssh.service | egrep "Failed|Failure"




nameserver 127.0.0.53
options edns0 trust-ad



_____________________________________________________________________________________
РЕШЕНИЕ ПРОБЕЛМ С ОБНОВЛЕНИЕМ UPDATE UBUNTU - ТОЛОЬТКО ДО ПЕРЕЗАГРУЗКИ !!!!!!!!!!
_____________________________________________________________________________________

РАБОЧАЯ ТЕМА 
==============================================================================================
==============================================================================================
==============================================================================================
Но глобальная переменная DNS является все также systemd-resolver.

Для изменения глобальной переменной необходимо проделать следующие действия:

    откройте и отредактируйте следующий файл:

sudo nano /etc/systemd/resolved.conf

[Resolve]
DNS=10.5.5.1
...

Примените изменения:

sudo systemctl restart systemd-resolved.service

Посмотрим еще раз на глобальные переменные DNS

sudo systemd-resolve --status

Global
       LLMNR setting: no                  
MulticastDNS setting: no                  
  DNSOverTLS setting: no                  
      DNSSEC setting: no                  
    DNSSEC supported: no                  
         DNS Servers: 10.5.5.1            
          DNSSEC NTA: 10.in-addr.arpa   
.....

Из вывода видно что наш DNS изменился на 10.5.5.1.

Но вывод nslookup также покажет systemd-resolver. 
    Устанавливаем resolvconf

sudo apt install resolvconf

Открываем файл и вносим изменения:

nano /etc/resolvconf/resolv.conf.d/head

# Dynamic resolv.conf(5) file for glibc resolver(3) generated by resolvconf(8)
#     DO NOT EDIT THIS FILE BY HAND -- YOUR CHANGES WILL BE OVERWRITTEN
# 127.0.0.53 is the systemd-resolved stub resolver.
# run "systemd-resolve --status" to see details about the actual nameservers.

nameserver 10.5.5.1

Применим наши изменения

sudo resolvconf -u

Теперь вывод nslookup покажет наш DNS сервер

nslookup ya.ru

Server:   10.5.5.1
Address:  10.5.5.1#53

Non-authoritative answer:
Name: ya.ru
Address: 87.250.250.242
Name: ya.ru
Address: 2a02:6b8::2:242


==============================================================================================
==============================================================================================
==============================================================================================






ПО умолчанию  nameserver 127.0.0.53 в файле

echo "nameserver 8.8.8.8" | sudo tee /etc/resolvconf/resolv.conf.d/base > /dev/null

8.8.8.8 is Googles own DNS server. 

НАДО ДОБАВЛЯТь В ЛДРУГОЙ ФАЙЛ


edns0


iface eno1 inet dhcp
dns-nameservers 8.8.8.8
auto eno1



auto edns0
iface edns0 inet dhcp



Настройка DNS через терминал Ubuntu

В Ubuntu есть унифицированный интерфейс настройки сети, который настраивается через конфигурационный файл /etc/network/interfaces. Сначала смотрим список сетевых интерфейсов:

ls /sys/class/net/

Откройте файл для редактирования и найдите в нем имя своего сетевого интерфейса, например, auto enp0s3, если такой секции нет, ее нужно добавить:

sudo vi /etc/network/interfaces

auto enp0s3
iface enp0s3 inet dhcp

Затем, добавьте в эту секцию строчку:

dns-nameserver 8.8.8.8

Здесь адрес 8.8.8.8 - это адрес вашего DNS сервера. Но эта настройка сработает, только если ваш DHCP клиент не пытается назначить адрес самостоятельно. Чтобы указать DNS адрес на уровне DHCP сервера нужно добавить такую строчку в конфигурационный файл /etc/dhcp/dhclient.conf:

sudo vi /etc/dhcp/dhclient.conf

supersede domain-name-servers 8.8.8.8

Здесь тоже адрес 8.8.8.8 означает адрес DNS сервера. Для верности, вы можете добавить свои адреса DNS серверов в файл /etc/resolvconf/resolv.conf.d/base:

sudo vi /etc/resolvconf/resolv.conf.d/base

nameserver 8.8.8.8

Чтобы настройки вступили в силу необходимо перезапустить сеть:

sudo systemctl restart networking

Возможно, даже лучше будет если вы полностью перезагрузите компьютер. Теперь вы можете открыть /etc/resolv.conf и посмотреть применялся ли новый адрес DNS:




_____________________________________________________________________________________

Установка ЛОКАЛЕЙ РУ
_____________________________________________________________________________________


Check which locales are supported

locale -a

Add the locales you want (for example ru):

    sudo locale-gen ru_RU
    sudo locale-gen ru_RU.UTF-8

    Run this update command:

    sudo update-locale 



sudo -u postgres psql - ЗАХОДИТЬ ИМЕННО ТАК






ВЫЙТИ ИЗ ВИРТУАЛЬНОГО ОКРУЖНИЯ

deactivate - 


_____________________________________________________________________________________
_____________________________________________________________________________________

УСТНАОВКА nifi
_____________________________________________________________________________________
_____________________________________________________________________________________

apt-get update
apt-get install openjdk-8-jdk

/usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

sudo nano /etc/profile.d/java.sh


#/bin/bash
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64



 env | grep JAVA_HOME

JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64



mkdir /downloads/apache-nifi -p
cd /downloads/apache-nifi
wget https://apache-mirror.rbc.ru/pub/apache/nifi/1.13.0/nifi-1.13.0-bin.tar.gz



tar -zxvf nifi-1.13.0-bin.tar.gz

mv nifi-1.13.0 /opt/
ln -s /opt/nifi-1.13.0/ /opt/nifi
cd /opt/nifi
bin/nifi.sh install




C:\Users\andrey.morozov\Documents\PERS\putty-0.73-ru-17-portable\private-putty.ppk



https://jdbc.postgresql.org/download/postgresql-42.2.19.jar

/home/solopharm/nifi
оз


/etc/init.d/nifi start





Поставил в оригинальном файле имена полей в верхнем регистре, ушла ошибка по нормализованным именам, но теперь ругается "not a data file"





++++++++++++++++++++++++++++++++++++++++++++++++++++
CASSANDRA
++++++++++++++++++++++++++++++++++++++++++++++++++++

CREATE KEYSPACE dwh with replication = {'class' : 'SimpleStrategy', 'replication_factor' : 3};

create table dwh.flights (
  id text,
num bigint ,
 dateair text,
 flight text,
 company text,
 airport text,
 statusflight text,
 PRIMARY KEY (id)
  );


____________________________
СОЗДАТЬ ПОЛЬЗОВАТЕЛЯ

CREATE USER nifi_user WITH PASSWORD '1q2w3e4r5T' superuser;


insert into flights (num, dateair, flight, company, airport, statusflight ) values (${num}, '${dateair}', '${flight}', '${company}', '${airport}', '${statusflight}')

insert into flights (num, dateair, flight, company, airport, statusflight ) values (${num}, ${dateair}, ${flight}, ${company}, ${airport}, ${statusflight});

insert into flights (num, dateair, flight, company, airport, statusflight ) values (?, ?, ?,?,?,?);


insert into flights (id, num, dateair, flight, company, airport, statusflight ) values (${id}, ${num}, ${dateair}, ${flight}, ${company}, ${airport}, ${statusflight});

insert into flights (id, num, dateair, flight, company, airport, statusflight ) values ('?', 5, '', '','','',''); - работает

insert into flights (id, num, dateair, flight, company, airport, statusflight ) values ('${id}', ${num}, '${dateair}', '${flight}', '${company}', '${airport}', '${statusflight}');
x

++++++++++++++++++++++++++++++++++++++++++++++++++++
ПОСМОТРЕТЬ ОТКРЫТЫЕ ПОРТЫ
++++++++++++++++++++++++++++++++++++++++++++++++++++


netstat -pnltu

ЛУЧШЕ ВСЕГО
sudo lsof -i -P

 iptraf-ng
 
 
 
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 РАЗРЕШИТЬ ВХОДЯЩИЕ IPTABLES D HT:BVT IN_public_allow
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
 iptables -I IN_public_allow -p tcp --dport 8123 -j ACCEPT
 
 
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 RUN Superset
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 superset run -h 10.128.100.98  -p 8088
 
 
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 CRONTAB @reboot
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
 1. sudo -i
 2. create sh script in /etc/iptablesmy/iptablesmy.sh (example)
 
 -----
 #!/bin/bash
 iptables -I IN_public_allow -p tcp --dport 8123 -j ACCEPT
 -----

 3. chmod +x ....sh
 4. crontab -e (sudo -i)
 5. add row
 @reboot /etc/iptablesmy/iptablesmy.sh
 6. save, reboot, check
 
 
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 SYSTEM PARAMETERS MOTHERBOARD esp.
 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 
sudo dmidecode -t

