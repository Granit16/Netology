# Домашнее задание к занятию «Управление доступом»

## Задание 1. Создайте конфигурацию для подключения пользователя
1. Создайл и SSL-сертификат для подключения к кластеру и подписал его сертификатом кластера.
 
   ```openssl genrsa -out netology.key 2048```
   
   ```openssl req -new -key netology.key -out netology.csr -subj "/CN=netology/O=ops"```
   
   ```openssl x509 -req -in netology.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out netology.crt -days 500```

   

2. Настроил конфигурационный файл kubectl для подключения

   - создал пользователя **netology**: ```kubectl config set-creadentials netology --client-certificate=netology.crt --client-key=netology.key --embed-certs=true```
  
   - создал контекст для пользователя и кластера: ```kubectl config set-context netology --cluster=microk8s-cluster --user=netology```



    

## Задание 2.Создать приложение с вашей веб-страницей, доступной по HTTPS
1. Создал [**Deployment**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/nginx-dep.yaml) приложения, состоящего из Nginx.
2. Создал собственную веб-страницу и подключил её как [**ConfigMap**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/api-html.yaml) к приложению.
3. Выпустил самоподписной сертификат SSL. Создал [**Secret**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/secret.yaml) для использования сертификата.
4. Создал [**Ingress**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/ingress.yaml) и необходимый [**Service**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/yaml/nginx-service.yaml), подключить к **Ingress** SSL-сертификаты через созданный **Secret**.
5. Доступ к приложению по HTTPS с локальной машины есть (DNS имя задано в файле **/etc/hosts**):

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/08/pics/https.png)


