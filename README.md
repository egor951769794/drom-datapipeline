
# Data pipeline для объявлений с Drom.ru
<sub>(some features may be work in progress)</sub>


**ETL & ELT** процессы, включающие парсинг, обработку и хранение данных об объявлениях о продаже авто на [drom.ru](https://auto.drom.ru) в виде звёздной схемы в DWH PostgreSQL, а также в сыром виде в MinIO Datalake.  
Сквозной пайплайн: сырые данные -> аналитические таблицы в PostgreSQL с использованием Kafka и Spark Streaming.
---
![Project structure](readme_images/structure.png)

---

##  Key features

- **Realtime ETL & ELT**: парсинг -> загрузка в Datalake/преобразование -> загрузка в DWH;
- **Звёздная схема**: для быстрой аналитики;
- **Защита от дубликатов**: Kafka KRaft кластер с репликами для отказоустойчивости, idempotent producer; кастомные Kafka consumer с ручным управлением коммитами;
- **История изменений**: объявления, повторно опубликованные с изменениями, сохраняются как новая запись в DWH;
- **Локальная разработка**: запуск через Docker Compose.

---

## Cтек

| Этап | Инструмент|
|--------|------------|
| **Источник данных** | Python скрапер & парсер|
| **Обработка** | PySpark Structured Streaming |
| **Брокер сообщений** | Apache Kafka KRAFT кластер (3 сервера; 3 патриции, 3 реплики) |
| **DWH** | PostgreSQL (факты + измерения) |
| **Datalake** | MinIO (сырые json, jpg изображения) |
| **Контейнеризация** | Docker Compose |
| **Мониторинг** | MinIO UI, pgAdmin 4 |
| **Аналитика** | WIP |
| **Алертинг** | WIP |

---

## Структура данных DWH

![Data Warehouse Structure](readme_images/dwh_tables.png)

### Таблица фактов
- `bulls fact`
  - `event_id` (BIGINT) — автоинкремент
  - `bull_id` (TEXT) — ID объявления
  - `bull_hash` (BIGINT) — хэш от изменяемых полей
  - `car_key`, `date_key`, `condition_key` (BIGINT) — внешние ключи к таблицам измерений
  - `price_rub`, `mileage`, `location`, `num_of_owners`, `num_of_previous_bulls` — изменяемые поля

### Таблицы измерений
- `dim_car` — характеристики авто (`manufacturer`, `model`, `engine_capacity`, `color`, ...)
- `dim_date` — дата публикации (`year`, `month`, `is_weekend`, ...)
- `dim_condition` — BOOLEAN значения флагов состояния (`broken`, `no_docs`, `owned_by_company`, `has_penalties`, ...)

---

## Запуск
### Требования
1. Docker 
2. Python 3
---
### Запуск
1. **Клонировать репозиторий**
   ```bash
   git clone https://github.com/egor951769794/drom-datapipeline.git
В директории **drom-dwh**:
   
 2. **Запустить docker контейнеры**
	 ```bash
	   docker-compose --profile "*" up --build
2. **Запустить источник данных**
	```bash
	   .venv\Scripts\activate
	   python ./data-extraction/main.py

3. **Веб-интерфейсы**
	- MinIO Datalake доступен по `localhost:9091`; логин `dev_admin`, пароль `dev_password`;
	- pgAdmin доступен по `localhost:8080`, авторизация через почту `user@postgres.com`, пароль `pwd`, подключение к БД `dwh` — по порту `5432` через пользователя `user` пароль `pwd`;

>**Important note**: конфигурация города для поиска объявлений (**временно**) осуществляется посредством редактирования `drom-dwh/data-extraction/main.py` и словаря `REGIONS` в `drom-dwh/data-extraction/misc/constants.py`

## Future Plans
- тестирование на больших (синтетических) данных;
- построение дашбордов с дневной аналитикой;
- внедрение ML-моделей для предсказания ключевых параметров;
- алертинг;
- подключение дополнительных источников данных.
