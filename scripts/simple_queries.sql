--Получить все уникальные маршруты, по которым ездит автобус:
SELECT DISTINCT r.route_id, r.route_nm
FROM ts.route r
JOIN ts.transport t ON r.route_id = t.route_id
WHERE t.bus_flg = TRUE;


--Получить информацию о всех уникальных водителях, которые водят автобусы:
SELECT DISTINCT d.driver_id, d.driver_nm, d.driver_srnm
FROM ts.driver d
JOIN ts.transport t ON d.driver_id = t.driver_id
WHERE t.bus_flg = TRUE;

--Получить все номера автобусов, которые ходят по маршруту с route_id равным 3:
SELECT bi.bus_no
FROM ts.bus_info bi
JOIN ts.transport t ON bi.transport_id = t.transport_id
WHERE t.route_id = 3;

--Получить всех водителей, которые начали работать после 2020 года:
SELECT * FROM ts.driver
WHERE hired_at > '2020-01-01';

UPDATE ts.bus_info
SET capacity = 100
WHERE transport_id = 1;

UPDATE ts.driver
SET hired_at = CURRENT_DATE
WHERE driver_id = 2;

DELETE FROM ts.driver
WHERE driver_id = 5;

-- Удалить все автобусы с fuel = 'gas':
DELETE FROM ts.bus_info
WHERE fuel = 'gas';

-- Обновить все автобусы с fuel = 'petrol' на 'electricity':
UPDATE ts.bus_info SET fuel = 'electricity'
WHERE fuel = 'petrol';

-- Удалить все маршруты, которые не используются:
DELETE FROM ts.route
WHERE route_id NOT IN (SELECT route_id FROM ts.transport);


