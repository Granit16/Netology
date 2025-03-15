# Домашнее задание к занятию «Хранение в K8s. Часть 1»

## Задание 1. Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.
1. Создал [**deployment.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/yaml/deployment.yaml) приложения, состоящего из контейнеров busybox и multitool.
2. busybox писал каждые пять секунд пишет текущую **date** в файл ```/localtgime/time```, который является общим для контейнеров [тип emptyDir: {}]
3. Возможность чтения файла контейнером multitool имеется.
4. multitool может читать файл, который обновляется каждые 5 секунд.
5. Скриншот вывода команды из п.4:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/pics/cat_time.png)
   


    

## Задание 2. Создать DaemonSet приложения, которое может прочитать логи ноды.
1. Создал [**daemonset.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/yaml/daemonset.yaml) приложения, состоящего из multitool.
2. Обеспечил возможность чтения файла /var/log/syslog кластера MicroK8S, подключив том типа ```hostPath```.
3. Возможность чтения файла изнутри пода есть.
4. Скриншоты команды из п.3 (на самом деле там очень много логов, выводить их в срин смылса нет.):


![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/06/pics/cat_var_log.png)
