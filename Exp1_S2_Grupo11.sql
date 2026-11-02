-- ==========================================
-- CONSULTA DE BASES DE DATOS - SEMANA 2
-- ACTIVIDAD FORMATIVA: SHIVERSALE
-- ==========================================

-- CASO 1: ANALISIS DE FACTURAS
SELECT NUMFACTURA AS "N° Factura",
       TO_CHAR(FECHA, 'DD "de" FMMonth "de" YYYY') AS "Fecha Emisión",
       LPAD(RUTCLIENTE, 10, '0') AS "RUT Cliente",
       TO_CHAR(NETO, 'FM$999G999G990') AS "Monto Neto",
       TO_CHAR(IVA, 'FM$999G999G990') AS "Monto Iva",
       TO_CHAR(TOTAL, 'FM$999G999G990') AS "Total Factura",
       CASE
           WHEN TOTAL BETWEEN 0 AND 50000 THEN 'Bajo'
           WHEN TOTAL BETWEEN 50001 AND 100000 THEN 'Medio'
           ELSE 'Alto'
       END AS "Categoria Monto",
       DECODE(CODPAGO,
              1, 'EFECTIVO',
              2, 'TARJETA DEBITO',
              3, 'TARJETA CREDITO',
              'CHEQUE') AS "Forma de pago"
FROM FACTURA
WHERE EXTRACT(YEAR FROM FECHA) = EXTRACT(YEAR FROM SYSDATE) - 1
ORDER BY FECHA DESC, NETO DESC;

-- CASO 2: CLASIFICACION DE CLIENTES
SELECT LPAD(RUTCLIENTE, 12, '*') AS "RUT",
       NOMBRE AS "Cliente",
       NVL(TO_CHAR(TELEFONO), 'Sin teléfono') AS "TELÉFONO",
       NVL(TO_CHAR(CODCOMUNA), 'Sin comuna') AS "COMUNA",
       ESTADO,
       CASE
           WHEN SALDO / CREDITO < 0.5 THEN
               'Bueno (Credito disponible: ' ||
               TO_CHAR(CREDITO - SALDO, 'FM$999G999G990') || ')'
           WHEN SALDO / CREDITO BETWEEN 0.5 AND 0.8 THEN
               'Regular (Saldo adeudado: ' ||
               TO_CHAR(SALDO, 'FM$999G999G990') || ')'
           ELSE 'Critico'
       END AS "Estado Crédito",
       NVL(SUBSTR(MAIL, INSTR(MAIL, '@') + 1),
           'Correo no registrado') AS "Dominio Correo"
FROM CLIENTE
WHERE ESTADO = 'A'
  AND CREDITO > 0
ORDER BY NOMBRE ASC;

-- CASO 3: STOCK DE PRODUCTOS
SELECT CODPRODUCTO AS "ID",
       DESCRIPCION AS "Descripcion de Producto",
       NVL(
           CASE
               WHEN VALORCOMPRADOLAR IS NOT NULL THEN
                   TO_CHAR(VALORCOMPRADOLAR, 'FM999G999D00') || ' USD'
           END,
           'Sin registro'
       ) AS "Compra en USD",
       NVL(
           CASE
               WHEN VALORCOMPRADOLAR IS NOT NULL THEN
                   TO_CHAR(
                       ROUND(VALORCOMPRADOLAR * &TIPOCAMBIO_DOLAR, 0),
                       'FM$999G999G990'
                   ) || ' PESOS'
           END,
           'Sin registro'
       ) AS "USD convertidos",
       TOTALSTOCK AS "Stock",
       CASE
           WHEN TOTALSTOCK IS NULL THEN 'Sin datos'
           WHEN TOTALSTOCK < &UMBRAL_BAJO
               THEN '¡ALERTA stock muy bajo!'
           WHEN TOTALSTOCK <= &UMBRAL_ALTO
               THEN '¡Reabastecer pronto!'
           ELSE 'OK'
       END AS "Alerta Stock",
       CASE
           WHEN TOTALSTOCK > 80 THEN
               TO_CHAR(
                   ROUND(VUNITARIO - (VUNITARIO * 0.10), 0),
                   'FM$999G999G990'
               )
           ELSE 'N/A'
       END AS "Precio Oferta"
FROM PRODUCTO
WHERE UPPER(DESCRIPCION) LIKE '%ZAPATO%'
  AND UPPER(PROCEDENCIA) = 'I'
ORDER BY CODPRODUCTO DESC;
