# Домашнее задание к занятию «Организация сети»

## Задание 1. Yandex Cloud
1. С помощью Terrform cоздал VPC **netology-vpc**
   
2. Создал "публичную" подсеть с название **public**, сетью 192.168.10.0/24.
 - Создал в подсети NAT-инстанс **netology-nat-vm**, присвоил ему адрес 192.168.10.254. Вкачестве image_id использовал fd80mrhj8fl2oe87o4e1.
 - Также в этой подсети создал ВМ **netology-public-vm** с публичным IP, подключился к ней и убедился, что доступ к интернету есть.

3. Создал "приватную" подсеть с названием **private**, сетью 192.168.20.0/24.
 - Создал route table **netology-rt**. Добавил статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс. Указал эту таблицу маршрутизации для подсети **private**
 - Создал в "приватной" подсети виртуалку с внутренним IP, подключился к ней через виртуалку, созданную ранее (пробросив SSH-ключ), и убедился, что доступ к интернету есть.















1. Создал [**deployment.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/yaml/deployment.yaml) приложения, состоящего из двух контейнеров — nginx и multitool. Для решение проблемы задал порт для multitool **1180**.
2. Увеличил количество реплик работающего приложения до 2: ```kubectl scale deployment nginx-mltl-deployment --replicas=2```.
3. Количество подов

до масштабирования:
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/pics/get_pods_1.png)

после масштабирования:
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/pics/get_pods_2.png)

   
4. Создал [**service.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/yaml/service.yaml), который обеспечивает доступ до реплик приложений из п.1.
5. Создал отдельный Pod [**multitool.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/yaml/multitool.yaml) с приложением multitool и убедился с помощью curl, что из пода есть доступ до приложений из п.1 (на 80 порту nginx, на 8080 - multitool):

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/pics/curl.png)

    

## Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Cоздал [**Deployment приложения nginx**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/yaml/nginx-deployment.yaml) и обеспечил старт контейнера только после того, как будет запущен сервис этого приложения: ```command: ['sh', '-c', "until nslookup nginx-init-svc.$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace).svc.cluster.local; do echo waiting for nginx-init-svc; sleep 2; done"]```

2. Убедился, что nginx не стартует. В качестве Init-контейнера использовал busybox.
3. Создал и запустил [**Service**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/yaml/nginx-init-svc.yaml). Убедился что Init запустился.
4. Состояние подов
   
до запуска сервиса:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/pics/get_before.png)

после запуска сервиса.

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/pics/get_after.png)

