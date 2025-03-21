# Домашнее задание к занятию «Helm»

## Задание 1. Подготовить Helm-чарт для приложения
1. Упаковал приложение, состоящее из двух компанентов в чарт для деплоя в разные окружения, создав соответствующие шаблоны: [**Nginx**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/10/yaml/nginx-dep.yaml) и [**Multitool**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/10/yaml/multitool-dep.yaml)
2. Каждый компонент приложения деплоится отдельным deployment’ом

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/10/pics/install.png)

3. Образы и тэги приложений заданы переменными и при их зменении происходит их изменение:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/10/pics/upgrade.png)
   

2. Настроил конфигурационный файл kubectl для подключения

   - создал пользователя **netology**: ```kubectl config set-creadentials netology --client-certificate=netology.crt --client-key=netology.key --embed-certs=true```
  
   - создал контекст для пользователя и кластера: ```kubectl config set-context netology --cluster=microk8s-cluster --user=netology```


3. Создал объекты [**Role**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/09/yaml/role.yaml) и [**RoleBinding**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/09/yaml/role-binding.yaml)
   
5. Через роль дал созданному Пользователю права просматривать логи подов и их конфигурацию.
   
6. При переключении контекста возможно получать данные о подах кластера, но нельзя, например, их удалять:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/09/pics/get_delete.png)

  


