# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»

## Задание 1. Создать Deployment приложений backend и frontend
1. Создал Deployment приложения [**frontend.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/05/yaml/frontend.yaml) из образа nginx с количеством реплик 3 шт.
2. Создать Deployment приложения [**backend.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/05/yaml/backend.yaml) из образа multitool.
3. Внутрь этих манифестов вложил сервисы, которые обеспечивают доступ к обоим приложениям внутри кластера.
4. Приложения видят друг друга с помощью Service, при обращении по curl из под вспомогательного приложения **multitool**.
5. Скриншоты команды п.4:
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/05/pics/curl.png)
   


    

## Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создал отдельный [**service-out.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/yaml/service-out.yaml) приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.
2. Доступ с помощью curl с локального компьютера имеется.
3. Скриншот вывода команды п.2:
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/04/pics/curl_nodePort.png)


