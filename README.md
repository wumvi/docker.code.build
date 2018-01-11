##### Сборка образа
```
docker build -t wumvi/code.build --no-cache -f Dockerfile .
```

##### Запуск образа
```
docker build -t wumvi/code.build --no-cache -f code.build/Dockerfile .
```

##### Создание архивов
```
docker run --rm -ti wumvi/code.build -v /www/project:/www/project/ /make-archive.sh /www/project/
```
