# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1»

## Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера
1. Создал [**deployment.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/yaml/deployment.yaml) приложения, состоящего из двух контейнеров: **nginx** и **multitool**, с количеством реплик 3 шт.
2. Создал [**service.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/yaml/service.yaml), который обеспечивает доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — **nginx** 80, по 9002 — **multitool** 8080.
3. Создал отдельный [**multitool-pod.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/yaml/multitool-pod.yaml) с приложением multitool. С помощью curl, убедился что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/pics/curl.png)
   
4. Доступ есть в том числе по доменному имени сервиса
5. Скриншот вывода команд п.4:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/pics/curl_dns.png)


    

## Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создал отдельный [**service-out.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/yaml/service-out.yaml) приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.
2. Доступ с помощью curl с локального компьютера имеется.
3. Скриншот вывода команды п.2:
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/pics/curl_nodePort.png)


