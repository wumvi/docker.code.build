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

```
### Удаление Gzip
for i in `find ./public/res/* -type f -name '*.js.gz'`; do echo $i; rm $i; done;
for i in `find ./public/res/* -type f -name '*.css.gz'`; do echo $i; rm $i; done;
for i in `find ./public/res/* -type f -name '*.svg.gz'`; do echo $i; rm $i; done;

##### Удаление Brotli
for i in `find ./public/res/* -type f -name '*.js.br'`; do echo $i; rm $i; done;
for i in `find ./public/res/* -type f -name '*.css.br'`; do echo $i; rm $i; done;
for i in `find ./public/res/* -type f -name '*.svg.br'`; do echo $i; rm $i; done;
```
