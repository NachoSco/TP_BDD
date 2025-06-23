-- Ejemplo Administrador
CREATE USER admin_juan WITH PASSWORD 'juan123' LOGIN;
GRANT Administrador TO admin_juan;

-- Ejemplo Cliente
CREATE USER cliente_pedro WITH PASSWORD 'pedro123' LOGIN;
GRANT Cliente TO cliente_pedro;

-- Ejemplo Publicador
CREATE USER publicador_carlos WITH PASSWORD 'carlos123' LOGIN;
GRANT Publicador TO publicador_carlos;