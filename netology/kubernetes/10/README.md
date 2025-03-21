# Домашнее задание к занятию «Helm»

## Задание 1. Подготовить Helm-чарт для приложения
1. Упаковал приложение, состоящее из двух компанентов в чарт для деплоя в разные окружения, создав соответствующие шаблоны: [**Nginx**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/10/yaml/nginx-dep.yaml) и [**Multitool**](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/10/yaml/multitool-dep.yaml)
2. Каждый компонент приложения деплоится отдельным deployment’ом

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/10/pics/install.png)

3. Образы и тэги приложений заданы переменными:

![](https://github.com/Granit16/Netology/blob/main/netology/kubernetes/10/pics/upgrade.png)
   

## Задание 2. Запустить две версии в разных неймспейсах

1. Запустил несколько копий приложения:
   
