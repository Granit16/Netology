# Домашнее задание к занятию «Хранение в K8s. Часть 2»

## Задание 1. Создать Deployment приложения, использующего локальный PV, созданный вручную.
1. Создал [**Deployment**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/07/yaml/dep.yaml) приложения, состоящего из контейнеров busybox и multitool.
2. Создал [**PV**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/07/yaml/pv.yaml) и [**PVC**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/07/yaml/pvc.yaml) для подключения папки на локальной ноде, которая будет использована в поде.
3. multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/07/pics/tail_multitool.png)

4. Удалил **Deployment** и **PVC**, **PV** остался работать, так как это независимый объект:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/07/pics/del_dep_pvc.png)

6. Файл сохранился на локальном диске ноды, даже после удаления PV, так как мы указали политику Retain.
Предоставить манифесты, а также скриншоты или вывод необходимых команд.

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/07/pics/del_pv.png)
   


    

## Задание 2. Создать Deployment приложения, которое может хранить файлы на NFS с динамическим созданием PV.
1. Включил и настроить NFS-сервер на MicroK8S.
Создать Deployment приложения состоящего из multitool, и подключить к нему PV, созданный автоматически на сервере NFS.
Продемонстрировать возможность чтения и записи файла изнутри пода.
Предоставить манифесты, а также скриншоты или вывод необходимых команд.


![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/pics/cat_var_log.png)
