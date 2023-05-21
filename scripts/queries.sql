-- Получить количество маршрутов для каждого вида транспорта, но отобразить только те, для которых количество
-- маршрутов более 2:
SELECT bus_flg, COUNT(route_id)
FROM ts.transport
GROUP BY bus_flg
HAVING COUNT(route_id) > 2;

-- Получить список водителей, упорядоченных по дате найма:
SELECT driver_id, driver_nm, driver_srnm, hired_at
FROM ts.driver
ORDER BY hired_at;

-- Получить общее количество маршрутов для каждого вида транспорта (автобус / не автобус):
SELECT transport_id, bus_flg, COUNT(route_id) OVER(PARTITION BY bus_flg) AS total_routes
FROM ts.transport;

-- Получить список водителей и их ранг по дате найма (тот, кто был нанят раньше, получает более высокий ранг):
SELECT driver_id, driver_nm, driver_srnm, hired_at, RANK() OVER(ORDER BY hired_at) as rank
FROM ts.driver;

-- Получить список водителей и дату найма следующего водителя (в пределах одного и того же вида транспорта):
SELECT driver_nm, driver_srnm, hired_at, LEAD(hired_at) OVER(PARTITION BY bus_flg ORDER BY hired_at) as next_hired
FROM ts.driver d
JOIN ts.transport t ON d.driver_id = t.driver_id;

-- Получить общее количество маршрутов для каждого вида транспорта и ранг водителя по дате найма (в пределах одного и того же вида транспорта):
SELECT driver_nm, driver_srnm, hired_at, bus_flg, COUNT(route_id) OVER(PARTITION BY bus_flg) AS total_routes, RANK() OVER(PARTITION BY bus_flg ORDER BY hired_at) as rank
FROM ts.driver d
JOIN ts.transport t ON d.driver_id = t.driver_id;