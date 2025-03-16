# Домашнее задание к занятию «Хранение в K8s. Часть 2»

## Задание 1. Создать Deployment приложения, использующего локальный PV, созданный вручную.
1. Создал [**Deployment**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/yaml/dep.yaml) приложения, состоящего из контейнеров busybox и multitool.
2. Создал [**PV**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/yaml/pv.yaml) и [**PVC**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/yaml/pvc.yaml) для подключения папки на локальной ноде, которая будет использована в поде.
3. multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/07/pics/tail_multitool.png)

Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему.
Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV. Продемонстрировать что произошло с файлом после удаления PV. Пояснить, почему.
Предоставить манифесты, а также скриншоты или вывод необходимых команд.

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/pics/cat_time.png)
   


    

## Задание 2. Создать DaemonSet приложения, которое может прочитать логи ноды.
1. Создал [**daemonset.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/yaml/daemonset.yaml) приложения, состоящего из multitool.
2. Обеспечил возможность чтения файла /var/log/syslog кластера MicroK8S, подключив том типа ```hostPath```.
3. Возможность чтения файла изнутри пода есть.
4. Скриншоты команды из п.3 (на самом деле там очень много логов, выводить их в срин смылса нет.):


![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/pics/cat_var_log.png)
