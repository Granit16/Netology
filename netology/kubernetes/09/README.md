# Домашнее задание к занятию «Конфигурация приложений»

## Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу
1. Создал [**Deployment**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/dep.yaml) приложения, состоящего из контейнеров nginx и multitool.
2. Назначил порт для multitool с помощью [**ConfigMap**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/cm-1.yaml).
3. pod стартовал и оба конейнера работают:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/pics/get_po.png)
   
4. Сделал простую веб-страницу и подключил её к Nginx с помощью [**ConfigMap**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/api-html.yaml). Подключил [**Service**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/service.yaml) и обратился к нему с помощью curl:
   
![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/pics/curl_service.png)


    

## Задание 2.Создать приложение с вашей веб-страницей, доступной по HTTPS
1. Создал [**Deployment**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/nginx-dep.yaml) приложения, состоящего из Nginx.
2. Создал собственную веб-страницу и подключил её как [**ConfigMap**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/api-html.yaml) к приложению.
3. Выпустил самоподписной сертификат SSL. Создал [**Secret**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/secret.yaml) для использования сертификата.
4. Создал [**Ingress**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/ingress.yaml) и необходимый [**Service**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/nginx-service.yaml), подключить к **Ingress** SSL-сертификаты через созданный **Secret**.
5. Доступ к приложению по HTTPS с локальной машины есть (DNS имя задано в файле **/etc/hosts**):

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/pics/https.png)


