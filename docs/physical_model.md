# Физическая модель

## bus_info

| Название        | Описание           | Тип данных  | Ограничения |
| ------------- |:-------------:| -----:|-----:|
| transport_id      | Уникальный идентификатор транспорта | INTEGER | FOREIGN KEY |
| fuel      | Тип топлива: petrol, gas, electricity    |  ENUM |  |
| capacity | Пассажировместимость    |    INTEGER | |
| bus_no | Номер автобуса  |    VARCHAR(20) | UNIQUE|

## metro_info

| Название        | Описание           | Тип данных  | Ограничения |
| ------------- |:-------------:| -----:|-----:|
| transport_id      |  Уникальный идентификатор транспорта | INTEGER | FOREIGN KEY |
| cars_cnt      | Число вагонов     | INTEGER | |
| capacity |   Пассажировместимость     |    CHAR(64) |  |

## transport

| Название        | Описание           | Тип данных  | Ограничения |
| ------------- |:-------------:| -----:|-----:|
| transport_id      | Уникальный идентификатор транспорта | INTEGER | PRIMARY KEY |
| driver_id      | Идентификатор водителя     |   INTEGER | FOREIGH_KEY |
| bus_flg | Является ли автобусом     |  BOOLEAN | NOT NULL |
| route_id | На каком маршруте ездит    |    INTEGER | FOREIGN KEY |

## driver

| Название        | Описание           | Тип данных  | Ограничения |
| ------------- |:-------------:| -----:|-----:|
| driver_id      | Идентификатор водителя | INT | PRIMARY KEY|
| driver_nm     | Имя водителя     |   VARCHAR(30) | |
| driver_srnm | Фамилия водителя   |    VARCHAR(30) | |
| hired_at | Когда был нанят в компанию      |  DATETIME | DEFAULT |

## route

| Название        | Описание           | Тип данных  | Ограничения |
| ------------- |:-------------:| -----:|-----:|
| route_id     | Идентификатор маршрута | INTEGER | PRIMARY KEY |
| route_nm      | Название маршрута     |   VARCHAR(50) |  |

## route-stop

| Название        | Описание           | Тип данных  | Ограничения |
| ------------- |:-------------:| -----:|-----:|
| route_id     | Идентификатор маршрута | INTEGER | FOREIGN KEY |
| stop_id      | Идентификатор остановки      |   INTEGER | FOREIGN KEY |
| no_on_route | Номер остановки на маршруте  |   INTEGER | NOT NULL |

## stop

| Название        | Описание           | Тип данных  | Ограничения |
| ------------- |:-------------:| -----:|-----:|
| stop_id      | Уникальный идентификатор пользователя | INT | PRIMARY KEY, NOT NULL |
| stop_nm      | Имя пользователя      |   VARCHAR(50) | UNIQUE, NOT NULL |
| bus_flg | Является ли автобусной   |    BOOLEAN | NOT NULL |


## stop_nm_history

| Название        | Описание           | Тип данных  | Ограничения |
| ------------- |:-------------:| -----:|-----:|
| curr_nm      | Текущее время остановки | VARCHAR(30) | NOT NULL |
| uppd      | Когда было обновление имени|   DATETIME | DEFAULT |
| stop_id |   Идентификатор остановки   |   INTEGER | FOREIGN KEY |
| change_id |   Идентификатор изменения   |  INTEGER | PRIMARY KEY |


