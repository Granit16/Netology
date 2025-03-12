# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1»

## Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера
1. Создал [**deployment.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/yaml/deployment.yaml) приложения, состоящего из двух контейнеров: **nginx** и **multitool**, с количеством реплик 3 шт.
2. Создал [**service.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/yaml/service.yaml), который обеспечивает доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — **nginx** 80, по 9002 — **multitool** 8080.
3. Создал отдельный [**multitool-pod.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/yaml/multitool-pod.yaml) с приложением multitool. С помощью curl, убедился что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/pics/curl.png)
   
4. Доступ есть в том числе по доменному имени сервиса
5. Скриншоты вывода команд п.4:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/pics/curl_dns.png)


    

## Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Cоздал [**Deployment приложения nginx**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/yaml/nginx-deployment.yaml) и обеспечил старт контейнера только после того, как будет запущен сервис этого приложения: ```command: ['sh', '-c', "until nslookup nginx-init-svc.$(cat /var/run/secrets/kubernetes.io/serviceaccount/namespace).svc.cluster.local; do echo waiting for nginx-init-svc; sleep 2; done"]```

2. Убедился, что nginx не стартует. В качестве Init-контейнера использовал busybox.
3. Создал и запустил [**Service**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/yaml/nginx-init-svc.yaml). Убедился что Init запустился.
4. Состояние подов
   
до запуска сервиса:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/pics/get_before.png)

после запуска сервиса.

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/pics/get_after.png)


