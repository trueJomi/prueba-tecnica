# Prueba Técnica: Generador de Lista de Personas

Este proyecto implementa un servicio que genera una lista de 10 personas con sus datos personales. El proyecto está dividido en backend y frontend.

## Descripción

El sistema consiste en una API REST desarrollada en Node.js con Express y TypeScript que consume la API externa [RandomUser.me](https://randomuser.me/api) para obtener datos aleatorios de personas. El frontend está desarrollado con React y TypeScript, utilizando TailwindCSS para los estilos.

### Datos mostrados por cada persona

- Nombre
- Género
- Ubicación
- Correo electrónico
- Fecha de nacimiento
- Fotografía

## Estructura del Proyecto

El proyecto está dividido en dos carpetas principales:

```
/
├── backend/     # Servidor API REST con Express
├── front/       # Aplicación React con TypeScript
```

## Backend

El backend sigue una arquitectura de capas con controladores, dominios, adaptadores e infraestructura.

### Tecnologías utilizadas

- Node.js
- Express https://expressjs.com/
- TypeScript
- Zod (validación) https://zod.dev/

### Ejecución del backend

```bash
cd backend
npm install
npm run dev
```

La API estará disponible en `http://localhost:3000`

## Frontend

El frontend es una aplicación React que consume la API del backend y muestra los datos de las personas en una interfaz amigable.

### Tecnologías utilizadas

- React
- TypeScript
- TailwindCSS https://tailwindcss.com/docs/installation/using-vite
- Vite

### Ejecución del frontend

```bash
cd front
npm install
npm run dev
```

La aplicación web estará disponible en `http://localhost:5173`

## Características

- Arquitectura en capas (Controllers, Domain, Adapters, Infrastructure)
- Validación de datos con Zod
- Manejo adecuado de errores
- Tipado estricto con TypeScript
- Interfaz responsiva con TailwindCSS
- Formateo de fechas con Intl.DateTimeFormat

## API Endpoints

- `GET /api?limit=10` - Obtiene una lista de personas con el límite especificado

## Estructura de los datos

Cada persona contiene:

```typescript
interface User {
  nombre: string;
  genero: string;
  ubicacion: string;
  email: string;
  fecha_nacimiento: string;
  img: string;
}
```

---

Para más información sobre la implementación, revisa el código en los directorios backend y front.