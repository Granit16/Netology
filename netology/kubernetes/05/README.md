# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»

## Задание 1. Создать Deployment приложений backend и frontend
1. Создал Deployment приложения [**frontend.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/05/yaml/frontend.yaml) из образа nginx с количеством реплик 3 шт.
2. Создать Deployment приложения [**backend.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/05/yaml/backend.yaml) из образа multitool.
3. Внутрь этих манифестов вложил сервисы, которые обеспечивают доступ к обоим приложениям внутри кластера.
4. Приложения видят друг друга с помощью Service, при обращении по curl из под вспомогательного приложения **multitool**.
5. Скриншоты вывода команды п.4:
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/05/pics/curl.png)
   


    

## Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера
1. Включил Ingress-controller в MicroK8S: ```microk8s enable ingress```.
2. Создал [**ingress.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/05/yaml/ingress.yaml), обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался frontend а при добавлении /api - backend.
3. Доступ с локального компьютера с помощью curl имеется
4. Скриншоты вывода команды п.3:
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/05/pics/curl_local.png)
