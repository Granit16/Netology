# Домашнее задание к занятию «Безопасность в облачных провайдерах»

## Задание 1. Yandex Cloud

1. С помощью Terraform создал симметричный ключ **netology-key** в KMS:
 ![](https://github.com/Granit16/Netology/blob/main/CloudProjectOrganisation/03/pic/netology_key.png)

C помощью этого ключа зашифровал содержимое бакета, созданного ранее:
 ![](https://github.com/Granit16/Netology/blob/main/CloudProjectOrganisation/03/pic/enc_object.png)

Теперь при обращении к объекту в bucket доступ закрыт:
 ![](https://github.com/Granit16/Netology/blob/main/CloudProjectOrganisation/03/pic/access_denied.png.png)



