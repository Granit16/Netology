# Домашнее задание к занятию «Хранение в K8s. Часть 1»

## Задание 1. Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.
1. Создал [**deployment.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/yaml/deployment.yaml) приложения, состоящего из контейнеров busybox и multitool.
2. busybox писал каждые пять секунд пишет текущую **date** в файл ```/localtgime/time```, который является общим для контейнеров [тип emptyDir: {}]
3. Возможность чтения файла контейнером multitool имеется.
4. multitool может читать файл, который обновляется каждые 5 секунд.
5. Скриншот вывода команды из п.4:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/pics/cat_time.png)
   


    

## Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера
1. Включил Ingress-controller в MicroK8S: ```microk8s enable ingress```.
2. Создал [**ingress.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/05/yaml/ingress.yaml), обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался **frontend**, а при добавлении /api - **backend**.
3. Доступ с локального компьютера с помощью curl имеется (DNS соответствие задано в файле **/etc/hosts**)
4. Скриншоты вывода команды п.3:
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/05/pics/curl_local.png)
