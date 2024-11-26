# GeoDjango Test Project 

## Описание проекта
Этот проект использует **GeoDjango** для работы с геопространственными данными. В проекте настроен Docker для упрощения развёртывания и использования.

## Условия запуска
Перед запуском убедитесь, что на вашей системе установлены:
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/)

## Структура проекта
- `Dockerfile`: описание Docker-образа для приложения.
- `docker-compose.yml`: конфигурация для управления несколькими контейнерами.
- `requirements.txt`: зависимости Python.
- `manage.py`: стандартный файл Django для управления проектом.

## Инструкция по запуску

1. **Склонируйте репозиторий**
   ```bash
   git clone https://github.com/timur737/geodj_test.git
   cd geodj_test
   ```

2. **Создайте .env файл**  
   Скопируйте `.env.example` в `.env` и `.env.db.example` в `.env.db` отредактируйте значения переменных окружения при необходимости:
   ```bash
   cp .env.example .env
   cp .env.db.example .env.db
   
   ```

3. **Соберите и запустите контейнеры**
   ```bash
   docker compose up -d --build
   ```

4. **Примените миграции**
   После успешного запуска контейнеров примените миграции базы данных:
   ```bash
   docker compose exec web python manage.py migrate
   ```

5. **Создайте суперпользователя**
   Для доступа к админке Django создайте суперпользователя:
   ```bash
   docker compose exec web python manage.py createsuperuser
   ```

6. **Откройте проект в браузере**
   По умолчанию проект доступен по адресу:  
   [http://localhost:8000](http://localhost:8000)

## Стандартные команды

- **Остановить контейнеры:**
  ```bash
  docker compose down
  ```

- **Просмотреть логи:**
  ```bash
  docker compose logs -f
  ```

- **Войти в контейнер:**
  ```bash
  docker compose exec web bash
  ```

- **Очистить контейнеры и удалить тома:**
  ```bash
  docker compose down -v
  ```

## GeoDjango зависимости
Убедитесь, что контейнеры включают следующие зависимости:
- `PostGIS` (в составе PostgreSQL)
- `GDAL`
- `GEOS`
- `PROJ`
