
![Duoc UC](https://www.duoc.cl/wp-content/uploads/2022/09/logo-0.png)

# 🧠 Consulta de Bases de Datos

**Estudiantes:** 
Sergio Sandoval Valenzuela

Vicente Milla Espinoza

**Profesor:** Eithel Gonzalez Rojas
**Carrera:** Analista Programador  
**Sede:** Santiago Online  

---

## 📖 Actividad actual – Semana 2

Este repositorio contiene el desarrollo de la **actividad formativa de la Semana 2**, denominada **Creando consultas utilizando funciones SQL**, de la asignatura Consulta de Bases de Datos (PRY2205).

El trabajo se basa en el caso **ShiverSale**, una empresa de venta de calzados, y tiene como objetivo construir consultas que permitan recuperar, transformar y presentar información de facturas, clientes y productos utilizando Oracle SQL Developer.

---

## 🎯 Propósito

Desarrollar consultas SQL aplicando:

- Sentencias `SELECT` y alias de columnas.
- Funciones de caracteres: `LPAD`, `UPPER`, `SUBSTR` e `INSTR`.
- Funciones numéricas: `ROUND`.
- Funciones de fecha: `SYSDATE` y `EXTRACT`.
- Conversión de datos mediante `TO_CHAR`.
- Tratamiento de valores nulos mediante `NVL`.
- Expresiones condicionales `CASE` y `DECODE`.
- Concatenación y operaciones matemáticas.
- Filtros mediante `WHERE`, `AND`, `LIKE`, `BETWEEN` e `IS NULL`.
- Ordenamiento mediante `ORDER BY`.
- Variables de sustitución mediante `&`.

---

## 🛠️ Herramientas utilizadas

- Oracle SQL Developer.
- Oracle Database.
- Git.
- GitHub.

---

## 📂 Archivos Semana 2

- `PRY2205_Exp1_S2_ShiverSale.sql`
- `README.md`

El script SQL contiene:

1. Consulta de análisis de facturas del año anterior.
2. Clasificación de clientes según su estado crediticio.
3. Reporte de stock de productos con conversión monetaria, alertas y descuentos.

---

## 📊 Informes desarrollados

**Informe 1: Análisis de Facturas**

Consulta de facturas emitidas durante el año anterior, mostrando fechas, RUT y montos formateados, clasificación del total y descripción de la forma de pago.

**Informe 2: Clasificación de Clientes**

Consulta de clientes activos con crédito positivo, incluyendo tratamiento de valores nulos, extracción del dominio de correo y clasificación del estado crediticio según la relación entre saldo y crédito.

**Informe 3: Stock de Productos**

Consulta de productos de calzado de procedencia `I`, mostrando el valor de compra en dólares, su conversión a pesos chilenos, alertas de stock y precio de oferta para productos con más de 80 unidades.

Utiliza las variables de sustitución:

- `&TIPOCAMBIO_DOLAR`
- `&UMBRAL_BAJO`
- `&UMBRAL_ALTO`

---

## ✅ Resultado

El script fue ejecutado de forma secuencial en Oracle SQL Developer, sin errores Oracle.

Se validó la ejecución de los tres informes SQL:

- **Análisis de Facturas:** 9 registros.
- **Clasificación de Clientes:** 13 registros.
- **Stock de Productos:** 17 registros.

Los resultados cumplen las condiciones, cálculos, formatos y ordenamientos establecidos para cada caso.

---
