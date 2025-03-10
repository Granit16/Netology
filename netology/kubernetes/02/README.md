# Домашнее задание к занятию «Базовые объекты K8S»

## ЗЗадание 1. Создать Pod с именем hello-world

1. Создал манифест для Pod [**hello-world-pod.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/02/yaml/hello-world-pod.yaml).
2. Использовал image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Подключился к кластеру на локальной desktop-машине, пробросил порт и в браузере обратился к созданному поду по проброшенному порту 127.0.0.1:8080:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/02/pics/port-forward.png)
    
    

## Задание 2. Создать Service и подключить его к Pod
1. Создал Pod с именем netology-web: [**netology-web-pod.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/02/yaml/netology-web-pod.yaml)
2. Использовал image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Создал Service с именем netology-svc и подключил к netology-web: [**netology-svc.yaml**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/02/yaml/netology-svc.yamll)
4. Подключился на локальной машине к Service с помощью kubectl port-forward и обратился к созданному поду по проброшенному порту 127.0.0.1:8080 (собственно идентичный результат):
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/02/pics/port-forward.png)

## Вывод команд kubectl get pods & kubectl get services

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/02/pics/status.png)
