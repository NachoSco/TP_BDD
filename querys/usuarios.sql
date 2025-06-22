-- PASO 3: Crear usuarios específicos y asignarles roles
-- Crear usuarios administradores
CREATE USER admin_juan WITH PASSWORD 'juan123' LOGIN;

-- Asignar rol de Administrador
GRANT Administrador TO admin_juan;

-- Crear usuarios clientes
CREATE USER cliente_pedro WITH PASSWORD 'pedro123' LOGIN;

-- Asignar rol de Cliente
GRANT Cliente TO cliente_pedro;

-- Crear usuarios publicadores
CREATE USER publicador_carlos WITH PASSWORD 'carlos123' LOGIN;

-- Asignar rol de Publicador
GRANT Publicador TO publicador_carlos;