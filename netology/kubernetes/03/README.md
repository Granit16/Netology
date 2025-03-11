# Домашнее задание к занятию «Запуск приложений в K8S»

## Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod
1. Создал Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Для решение проблемы задал порт для multitool **1180**.
2. Увеличил количество реплик работающего приложения до 2: ```kubectl scale deployment nginx-mltl-deployment --replicas=2```.
3. Количество подов

   до масштабирования:
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/pics/get_pods_1.png)

   после масштабирования:
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/pics/get_pods_2.png)

   
4. Создал Service, который обеспечивает доступ до реплик приложений из п.1.
5. Создал отдельный Pod с приложением multitool и убедился с помощью curl, что из пода есть доступ до приложений из п.1:

   ![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/03/pics/curl.png)

    

## Задание 2. Создать Service и подключить его к Pod
1. Создал Pod с именем netology-web: [**netology-web-pod.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/02/yaml/netology-web-pod.yaml)
2. Использовал image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Создал Service с именем netology-svc и подключил к netology-web: [**netology-svc.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/02/yaml/netology-svc.yamll)
4. Подключился на локальной машине к Service с помощью kubectl port-forward и обратился к созданному поду по проброшенному порту 127.0.0.1:8080 (собственно идентичный результат):
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/02/pics/port-forward.png)

## Вывод команд kubectl get pods & kubectl get services

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/02/pics/status.png)

