# Домашнее задание к занятию «Управление доступом»

## Задание 1. Создайте конфигурацию для подключения пользователя
1. Создайл и SSL-сертификат для подключения к кластеру и подписал его сертификатом кластера.
 
   ```openssl genrsa -out netology.key 2048```
   
   ```openssl req -new -key netology.key -out netology.csr -subj "/CN=netology/O=ops"```
   
   ```openssl x509 -req -in netology.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out netology.crt -days 500```

   

2. Настроил конфигурационный файл kubectl для подключения

   - создал пользователя **netology**: ```kubectl config set-creadentials netology --client-certificate=netology.crt --client-key=netology.key --embed-certs=true```
  
   - создал контекст для пользователя и кластера: ```kubectl config set-context netology --cluster=microk8s-cluster --user=netology```


3. Создал объекты [**Role**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/09/yaml/role.yaml) и [**RoleBinding**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/09/yaml/role-binding.yaml)
   
5. Через роль дал созданному Пользователю права просматривать логи подов и их конфигурацию.
   
6. При переключении контекста возможно получать данные о подах кластера, но нельзя, например, их удалять:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/09/pics/get_delete.png)

  


