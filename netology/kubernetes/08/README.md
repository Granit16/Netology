# Домашнее задание к занятию «Конфигурация приложений»

## Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу
1. Создал [**Deployment**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/dep.yaml) приложения, состоящего из контейнеров nginx и multitool.
2. Назначил порт для multitool с помощью [**ConfigMap**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/cm-1.yaml).
3. pod стартовал и оба конейнера работают:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/pics/get_po.png)
   
4. Сделал простую веб-страницу и подключил её к Nginx с помощью [**ConfigMap**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/api-html.yaml). Подключил [**Service**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/service.yaml) и обратился к нему с помощью curl:
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/pics/curl_service.png)


    

## Задание 2. Создать Deployment приложения, которое может хранить файлы на NFS с динамическим созданием PV.
1. Включил NFS-сервер на MicroK8S: ```microk8s enable hostpath-storage```.
2. Создал [**Deployment**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/07/yaml/multitool_dep.yaml) приложения состоящего из multitool, и подключил к нему PV, созданный автоматически на сервере NFS.
3. Возможность чтения и записи файла изнутри пода есть:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/pics/nfs.png)
