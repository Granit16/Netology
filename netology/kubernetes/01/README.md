# Домашнее задание к занятию «Kubernetes. Причины появления. Команда kubectl»

## Задание 1. Установка MicroK8S

1. Была создана ВМ в Yandex.Cloud **Ubuntu 24.04.2 LTS**, на ней было установлено microk8s: ```sudo snap install microk8s --classic```
2. Были установлены dashboard и dashboard-proxy: ```microk8s enable dashboard``` и ```microk8s enable dashboard-proxy```.
3. В файле **/var/snap/microk8s/current/certs/csr.conf.template** был добавлен внешний ip-адрес ВМ, а затем были обновлены сертификаты ```sudo microk8s refresh-certs --cert front-proxy-client.crt```.

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/01/pics/microk8s_status.png)
    
    

## Задание 2. Установка и настройка локального kubectl
1. Установил на локальную машину **kubectl**.
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/01/pics/kubectl_get_nodes1.png)
   
3. Настроил локальное подключение к кластеру: вывел config на мастер ноде и поместил его в **~/.kube/config**
4. Сделал port-forward ```kubectl port-forward -n kube-system service/kubernetes-dashboard 10443:443``` и подключился к dashboard

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/01/pics/microk8s_dashboard.png)
