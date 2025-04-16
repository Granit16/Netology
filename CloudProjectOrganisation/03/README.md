# Домашнее задание к занятию «Безопасность в облачных провайдерах»

## Задание 1. Yandex Cloud

1. С помощью Terraform создал симметричный ключ **netology-key** в KMS:
 ![](https://github.com/Granit16/Netology/blob/main/CloudProjectOrganisation/03/pic/netology_key.png)

C помощью этого ключа зашифровал содержимое бакета, созданного ранее:
 ![](https://github.com/Granit16/Netology/blob/main/CloudProjectOrganisation/03/pic/enc_object.png)








1. С помощью Terrform cоздал бакет Object Storage **damir20250415** с публичным доступом и разместил в нём файл с картинкой
 ![](https://github.com/Granit16/Netology/blob/main/CloudProjectOrganisation/02/pic/bucket_damir20250415.png)

2. Создал группу ВМ **netology-ig** с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета (использовал image_id = fd827b91d99psvq5fjit)
Для создания стартовой веб-страницы использовал раздел user_data в meta_data (разместил ссылку на картинку из бакета):
```
user-data  = <<EOF
#!/bin/bash
echo '<html><head><title>MyTitle</title></head> <body><h1>Hello, world!!!</h1><img src="https://storage.yandexcloud.net/damir20250415/man.jpeg"/><br>' > /var/www/html/index.html
curl 2ip.ru >> /var/www/html/index.html
echo '</body></html>' >> /var/www/html/index.html
EOF
```

3. Создал сетевой балансировщик **netology-nlb** и подключил к нему **netology-ig**
После удаления одной (а далее и двух ВМ), работоспостобность сохранилась:

  ![](https://github.com/Granit16/Netology/blob/main/CloudProjectOrganisation/02/pic/nlb.png)
