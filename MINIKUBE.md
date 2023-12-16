# Установка и настройка minikube

## Установка

Установить по [инструкции с официального сайта](https://minikube.sigs.k8s.io/docs/start/).

## Настройка сертификатов

Выполнить шаги [инструкции с официального сайта](https://minikube.sigs.k8s.io/docs/tutorials/custom_cert_ingress/)

## Проверить работоспособность

Пробросить порты
```bash
minikube tunnel
```

Поднять тестовое приложение
```bash
kubectl apply -n default -f ./ingress-test.yaml
```

Зайти в браузере на [https://foo.dev.localhost](https://foo.dev.localhost). Должно открыться без ошибок сертификата.

> Если есть ошибки, то сертификат не добавлен в доверенные издатели браузера

Удалить тестовое приложение
```bash
kubectl delete -n default -f ./ingress-test.yaml
```

