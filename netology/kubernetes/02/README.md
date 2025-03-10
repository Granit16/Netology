# Домашнее задание к занятию «Базовые объекты K8S»

## ЗЗадание 1. Создать Pod с именем hello-world

1. Создал манифест для Pod hello-world.yaml.
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Подключился к ластеру на локальной desktop-машине, пробросил порт и в браузере обратился к созданному поду по проброшенному порту 127.0.0.1:8080:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/02/pics/port-forward.png.png)
    
    

## Задание 2. Установка и настройка локального kubectl
1. Установил на локальную машину **kubectl**.
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/01/pics/kubectl_get_nodes1.png)
   
3. Настроил локальное подключение к кластеру: вывел config на мастер ноде и поместил его в **~/.kube/config**
4. Сделал port-forward ```kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443``` и подключился к dashboard

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/01/pics/microk8s_dashboard.png)
