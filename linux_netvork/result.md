# Операционные системы UNIX/Linux (Базовый).
## Part 1. Установить **Ubuntu 20.04 Server LTS** без графического интерфейса. (Используем программу для виртуализации - VirtualBox)

- Версия UBANTU, cat /etc/issue \
![task](../materials/task1.png)

## Part 2. Создать пользователя, отличного от пользователя, который создавался при установке. Пользователь должен быть добавлен в группу `adm`.

- Создание нового пользователя sudo useradd -G adm user2 \
![res](../materials/task2.png)

- Просмотр нового пользователя cat /etc/passwd \
![res](../materials/task2.2.png)

## Part 3. Настройка сети ОС

- Задать название машины user-1, с помощью sudo hostname user-1

- Установка временной зоны, соответствующей моему местоположению timedatectl set-timezone Europe/Moscow

- вывести названия сетевых интерфейсов с помощью консольной команды. \
![task3](../materials/task3.png)

Интерфейс lo является локальной петлёй, имеющей IP-адрес 127.0.0.1. Она предназначена для обеспечения сетевого доступа к компьютеру.

- Получить ip адрес устройства от DHCP сервера: sudo dhclient -v \
![task3.1](../materials/task3.1.png) \
DHCP (англ. Dynamic Host Configuration Protocol — протокол динамической настройки узла) — это протокол клиента или сервера, который автоматически предоставляет узел протокола IP с его IP-адресом и другие связанные сведения о конфигурации, такие как маска подсети и шлюз по умолчанию.

- Определить и вывести на экран внешний ip-адрес шлюза (ip) curl ifconfig.me/ip и внутренний IP-адрес шлюза ip route

![out_in](../materials/task3.2.png)

- задать статичные настройки ip, gw, dns. с помощью команды sudo vim /etc/netplan/00-installer-config.yaml

![ip](../materials/task3.3.png)

- пропинговала хосты 

![ping](../materials/ping.png)

## Part 4 Обновление ОС

- Обновить системные пакеты до последней на момент выполнения задания версии

![update](../materials/task4.png)

## Part 5. Использование команды **sudo**

- позволяет выполнять привилегированные команды обычным пользователям без необходимости ввода пароля суперпользователя root

- Чтоб дать возможность изменять имя хоста через другого пользователя, надо sudo usermode -a -G sudo user2 . Для переключения на второго пользователя : su user2. для переименования хоста. sudo hostname use

![task5](../materials/task5.png)

## Part 6. Установка и настройка службы времени

- вывод информации о времени на компьютере 

![task6](../materials/task6.png)

## Part 7. Установка и использование текстовых редакторов 

- редактор **vim**. для сохранения нажать (esc :w), для выхода (esc :q!) \
![vim](../materials/task7_vim.png) 

редактор **nano**. для выхода с сохранением изменений (cntrl + x - yes - entr) \
![nano](../materials/task7_nano.png) \
редактор **joe**. для выхода с сохранением изменений (ctrl+k, x)  \
![joe](../materials/task7-joe.png) \
редактор **vim**.  для выхода (esc :q!) \
![vim](../materials/task7_vim_21.png) \
 редактор **nano**. для выхода с сохранением изменений (cntrl + x - no - entr) \
![nano](../materials/task7-nano-21.png) \
**joe** для выхода без сохранения (ctrl+c - y)\
![](../materials/task7_joi_21.png)\

## Part 8. Установка и базовая настройка сервиса **SSHD**

- установка sudo apt install openssh-server

- автостарт службы sudo systemctl enable ssh

- результат перенастройки службы 
![port2022](../materials/task2022.png)

- ps -C sshd 
команда ps позволяет просмотреть список всех текущих процессов. 
Флаг -С - выбирать процессы по имени команды

- для перезагрузки использвала sudo shutdown -r now

- netstat (network statistics) — утилита командной строки, выводящая на дисплей состояние TCP-соединений. Опции –t показывают активные соединения TCP, флаг –a , также будут показаны сокеты, ожидающие соединения, -n показывает сетевые адреса как числа. netstat обычно показывает адреса как символы. Этот дисплей даст вам список всех серверов, которые в настоящее время работают в вашей системе.

Proto – протокол (tcp, udp). 

Recv-Q – количество байтов, помещённых в буфер приёма TCP/IP, но не переданных приложению.

Send-Q – количество байтов, помещённых в буфер отправки TCP/IP, но не отправленных, или отправленных, но не подтверждённых 

Local Address – локальный адрес сервера. 

Foreign Address – адрес второй стороны. В обычных соединения, это адрес с которого пришло соединение. 0.0.0.0:* – значит подключаться можно с любых адресов и с любых портов. 

State – состояние подключения, или прослушивания

![netstat](../materials/task8_result.png)

## Part 9.  Установка и использование утилит **top**, **htop**

установка и запуск утилиты top и htop 
uptime - 01:22:04

![thop](../materials/task9thop.png)

количество авторизованных пользавателей - 1 

общую загрузку системы - 185,3 

общее количество процессов - 97 

загрузку cpu - 0 

загрузку памяти - 970 

pid процесса занимающего больше всего памяти - 623 

![pid](../materials/task9_pid.png)

pid процесса, занимающего больше всего процессорного времени - 623

![pid](../materials/task9_pid.png) 

сортировка по PERCENT_CPU

![percent](../materials/task9_PERCENT_CPU.png)

сортировка по PERCENT_MEM

![mem](../materials/task9_PERCENT_MEM.png)

сортировка по TIME

![time](../materials/task9_TIME.png)

фильтровка для процесса sshd

![sshd](../materials/task9_sshd.png)

с процессом syslog, найденным, используя поиск

с добавленным выводом hostname, clock и uptime

![suslog](../materials/task9_suslog.png)

## part 10. Использование утилиты **fdisk**

- запустить каманду fdisk -1 
Название жесткого диска sda Размер - 8 gib. Кол-во сектаров - 13101056. Размер swap - 0

![task](../materials/task10.png)

## Part 11. Использование утилиты **df**

размер раздела - 6342332, размер занятого пространства - 4059184, размер свободного пространства - 1949292, процент использования - 68%
тип файловой системы - /dev/mapper/ubuntu--vg-ubuntu-lv

![task](../materials/task11.png)

## Part 12. Использование утилиты **du**
- вызов du\
  ![task](../materials/task12.png)\
- вывод размеров папок /home \
![home](../materials/task12_home.png)\
  вывод размеров папок /var \
![var](../materials/task12_var.png)\
  вывод размеров папок /var/log \
![var_log](../materials/task12_var_log.png)\
- Вывести размер всего содержимого в /var/log (не общее, а каждого вложенного элемента, используя *) \
![all](../materials/task12_var_log_all.png)

## Part 13. Установка и использование утилиты **ncdu**
- установка ncdu : sudo apt install ncdu
- ncdu /home = 51.3 KiB\
![linux](../materials/task13_home.png)\
ncdu /var = 785.9 MiB \
![linux](../materials/task13_var.png)\
  ncdu /var/log  = 43.0 MiB \
![linux](../materials/task13_var_log.png)

## Part 14. Работа с системными журналами
- less /var/log/dmesg \
![](../materials/task14_var_log.png)
\
- less /var/log/syslog \
![](../materials/task14_log_syslog.png)\
- less /var/log/auth.log \
![](../materials/task14_log_auth.png) \
время последней успешной авторизации - 11:17:43 \
имя пользователя - chesterh \ 
метод входа в систему - sudo \
![](../materials/task14_logs.png)

## Part 15. Использование планировщика заданий **CRON**
- Используя планировщик заданий, запустите команду uptime через каждые 2 минуты \
![](../materials/task15_cron.png) \
- строки о выполнение задачи через каждые 2 минуты \
![](../materials/task15_corn_session.png) \
- удаление всех заданий с помощью crontab -r \
![](../materials/task15_del.png)