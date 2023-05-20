CREATE SCHEMA IF NOT EXISTS ts;

CREATE TYPE ts.fuel AS ENUM ('petrol', 'gas', 'electricity');

CREATE TABLE IF NOT EXISTS ts.driver (
    driver_id SERIAL PRIMARY KEY,
    driver_nm VARCHAR(30),
    driver_srnm VARCHAR(30),
    hired_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS ts.route (
    route_id SERIAL PRIMARY KEY,
    route_nm VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS ts.stop (
    stop_id SERIAL PRIMARY KEY,
    stop_nm VARCHAR(50) UNIQUE NOT NULL,
    bus_flg BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS ts.transport (
    transport_id SERIAL PRIMARY KEY,
    driver_id INT,
    bus_flg BOOLEAN NOT NULL,
    route_id INT,
    FOREIGN KEY (driver_id) REFERENCES ts.driver(driver_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (route_id) REFERENCES ts.route(route_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ts.route_stop (
    route_id INT,
    stop_id INT,
    no_on_route INT NOT NULL,
    PRIMARY KEY(route_id, stop_id),
    FOREIGN KEY(route_id) REFERENCES ts.route(route_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY(stop_id) REFERENCES ts.stop(stop_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ts.stop_nm_history (
    curr_nm VARCHAR(30) NOT NULL,
    uppd TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    stop_id INT,
    change_id SERIAL PRIMARY KEY,
    FOREIGN KEY(stop_id) REFERENCES ts.stop(stop_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ts.bus_info (
    transport_id INT,
    fuel ts.fuel,
    capacity INT,
    bus_no VARCHAR(20) UNIQUE,
    PRIMARY KEY(transport_id),
    FOREIGN KEY(transport_id) REFERENCES ts.transport(transport_id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS ts.metro_info (
    transport_id INT,
    cars_cnt INT,
    capacity CHAR(64),
    PRIMARY KEY(transport_id),
    FOREIGN KEY(transport_id) REFERENCES ts.transport(transport_id) ON DELETE CASCADE ON UPDATE CASCADE
);