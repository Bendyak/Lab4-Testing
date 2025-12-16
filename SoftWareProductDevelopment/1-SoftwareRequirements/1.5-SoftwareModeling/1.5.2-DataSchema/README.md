### Схема даних (Data Definition Schema - DDS)

Обрана модель: Реляційна (PostgreSQL).

Схема описує таблиці на основі концептуальних класів, необхідних для забезпечення цілісності даних.

#### 1. Таблиця: users (Користувачі)
| Назва поля | Тип даних | Обмеження | Опис |
| :--- | :--- | :--- | :--- |
| user_id | SERIAL | PRIMARY KEY | Первинний ключ |
| username | VARCHAR(50) | NOT NULL | Ім'я користувача |
| education_level | VARCHAR(50) | | Рівень освіти |
| income_level | VARCHAR(50) | | Рівень доходу |

#### 2. Таблиця: housing (Житло)
| Назва поля | Тип даних | Обмеження | Опис |
| :--- | :--- | :--- | :--- |
| housing_id | SERIAL | PRIMARY KEY | Первинний ключ |
| provider_id | INT | FOREIGN KEY (providers) | Зовнішній ключ до постачальника |
| address | VARCHAR(255) | NOT NULL | Адреса житла |
| price | NUMERIC(10, 2) | NOT NULL | Ціна оренди |
| is_safe | BOOLEAN | | Безпечний район (фільтр) |
| has_workspace | BOOLEAN | | Наявність робочого простору (фільтр) |

#### 3. Таблиця: articles (Наукові статті)
| Назва поля | Тип даних | Обмеження | Опис |
| :--- | :--- | :--- | :--- |
| article_id | SERIAL | PRIMARY KEY | Первинний ключ |
| doi | VARCHAR(100) | UNIQUE | Digital Object Identifier |
| title | VARCHAR(255) | NOT NULL | Заголовок статті |
| publish_date | DATE | | Дата публікації |

#### 4. Таблиця: summaries (Згенеровані резюме)
| Назва поля | Тип даних | Обмеження | Опис |
| :--- | :--- | :--- | :--- |
| summary_id | SERIAL | PRIMARY KEY | Первинний ключ |
| article_id | INT | FOREIGN KEY (articles) | Зовнішній ключ до статті (1:1) |
| generated_text | TEXT | NOT NULL | Згенерований текст резюме |
| generation_time | TIMESTAMP | | Час генерації |
