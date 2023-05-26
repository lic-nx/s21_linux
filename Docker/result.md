## Part 1. Готовый докер

В качестве конечной цели своей небольшой практики вы сразу выбрали написание докер образа для собственного веб сервера, а потому в начале вам нужно разобраться с уже готовым докер образом для сервера.
Ваш выбор пал на довольно простой **nginx**.

**== Задание ==**

##### Взять официальный докер образ с **nginx** и выкачать его при помощи `docker pull`
![docker pull nginx](images/dockerPull1.png) 
##### Проверить наличие докер образа через `docker images`
![docker image 1](images/dockerImage1.png)
##### Запустить докер образ через `docker run -d [image_id|repository]`

![docker run -d](images/dockerRun-d1.png)

##### Проверить, что образ запустился через `docker ps`

![docker Ps](images/dockerPs1.png)

##### Посмотреть информацию о контейнере через `docker inspect [container_id|container_name]`

![docker inspect](images/dockerinspect1.png)

##### По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера
![docker ports](images/dockerPorts.png) \
![docker Container Size](images/dockerContainerSize.png) \
![docker ip](images/dockerIp.png)

##### Остановить докер образ через `docker stop [container_id|container_name]`
![dockerStop](images/dockerStop.png)
##### Проверить, что образ остановился через `docker ps`
![docker Ps Stop](images/dockerPsStop.png)
##### Запустить докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду *run*
![docker Ports 80 443.png](images/dockerPorts80443.png)
##### Проверить, что в браузере по адресу *localhost:80* доступна стартовая страница **nginx**
![docker localhost 80](images/dockerLocalhost80.png)
##### Перезапустить докер контейнер через `docker restart [container_id|container_name]`
##### Проверить любым способом, что контейнер запустился
![docker Restart + Ps](images/dockerRestartPs.png)

## Part 2. Операции с контейнером

Докер образ и контейнер готовы. Теперь можно покопаться в конфигурации **nginx** и отобразить статус страницы.

**== Задание ==**

##### Прочитать конфигурационный файл *nginx.conf* внутри докер контейнера через команду *exec*
![Docker Exec + Cat](images/DockerExecCat.png)
##### Создать на локальной машине файл *nginx.conf*
##### Настроить в нем по пути */status* отдачу страницы статуса сервера **nginx**
![docker nginx conf](images/dockernginxconf.png)
##### Скопировать созданный файл *nginx.conf* внутрь докер образа через команду `docker cp`
##### Перезапустить **nginx** внутри докер образа через команду *exec*
![docker cp](images/dockercp.png)
##### Проверить, что по адресу */status* отдается страничка со статусом сервера **nginx**
![doker server status](images/dokerserverstatus.png)
##### Экспортировать контейнер в файл *container.tar* через команду *export*
![docker export](images/dockerExport.png)
##### Остановить контейнер
![docker Stop 2](images/dockerStop2.png)
##### Удалить образ через `docker rmi [image_id|repository]`, не удаляя перед этим контейнеры
![docker Rmi](images/dockerRmi.png)
##### Удалить остановленный контейнер
![](images/dockerRmCont.png)
##### Импортировать контейнер обратно через команду *import*
![docker import](images/dockerrun2.png)
##### Запустить импортированный контейнер
![docker run 2](images/dockerImport.png)
##### Проверить, что по адресу *localhost:80/status* отдается страничка со статусом сервера **nginx**
![docker Up Servep](images/dockerUpServep.png)
- В отчёт поместить скрины:
  - вызова и вывода всех использованных в этой части задания команд;
  - содержимое созданного файла *nginx.conf*;
  - страницы со статусом сервера **nginx** по адресу *localhost:80/status*.

