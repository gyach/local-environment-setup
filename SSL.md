# Создание и установка самоподписанного SSL-сертификата

## Выпуск сертификата

Для выпуска самоподписанных сертификатов необходимо выполнить скрипт:

```bash
./ssl.dev.localhost.sh
```

> Скрипт несколько раз попросит ввести pass phrase - нужно ввести одинаковый код из 4 или более символов.

## Установка сертификата в браузер

Необходимо в браузере сделать доверенным корневой сертификат `localhost.root.cert.pem`.

> На примере Chrome: `Settings > Privacy and security > Security > Manage certificates > Authorities > Import`

## Установка в Java

1. Экспортировать сертификат `_.dev.localhost.crt` из браузера 
2. В папке `$JAVA_HOME/lib/security` выполнить

```bash
keytool -alias lh -import -keystore cacerts -file _.dev.localhost.crt
```

> `_.dev.localhost.crt` - экспортированный из браузера сертификат

