# api-library

API realizada con ruby on rails.

Tareas realizadas en este proyecto:
   - Realizar Endpoint CRUD para Libros y Usuarios
   - Desarrollar un endpoint para Préstamo y otro para Devolución tomando en cuenta
     que un usuario puede solicitar y devolver varios libros
   - Agregar los atributos que se estime necesario para que se cumpla lo solicitado
   - Implementar el proyecto en un servicio cloud
   - Utilizar una base de datos Postgres

#### Tecnologías: 
    - Ruby on Rails.
    - Postgres

### Dependencias de sistema
   - Ruby 2.6.6.
   - Rails 6.0.4

### Leyenda de tablas / estructura
User
  - id integer
  - email string
  - created_at timestamp
  - update_at timestamp

Library
  - id integer
  - title string
  - created_at timestamp
  - update_at timestamp

Overdraft
  - user_id integer
  - library_id integer
  - created_at timestamp
  - update_at timestamp

Return
  - user_id integer
  - library_id integer
  - created_at timestamp
  - update_at timestamp

# Estructura de envío y respuesta de la API

### Link del server para realizar las pruebas
https://api-library-jose.herokuapp.com/

- Se recomienda https://reqbin.com/ para realizar las pruebas

### Listado de todos los usuarios
**URL**: /users

**MÉTODO**: GET

Retorna:
```
    [{
        "id": 1,
        "email": "jose@test.com",
        "created_at": "2021-07-01T06:50:04.902Z",
        "updated_at": "2021-07-01T06:50:04.902Z"
    }]
```

### CRUD Creación de usuario
**URL**: /users

**MÉTODO**: POST

```
body:
    {
        "email": "jose@test.com"
    }
Retorna:
    {
        "id": 1,
        "email": "jose@test.com",
        "created_at": "2021-07-01T06:50:04.902Z",
        "updated_at": "2021-07-01T06:50:04.902Z"
    }
```

### CRUD Consulta de un usuario
**URL**: /users/:id

**MÉTODO**: GET

- id: es el identificador de un usuario

Retorna:
```
{
    "user": {
        "id": 1,
        "email": "jmanuelbello30@gmail.com",
        "created_at": "2021-07-01T06:50:04.902Z",
        "updated_at": "2021-07-01T06:50:04.902Z"
    },
    "returns": [{
        "id": 1,
        "user_id": 1,
        "library_id": 1,
        "created_at": "2021-07-01T06:52:18.762Z",
        "updated_at": "2021-07-01T06:52:18.762Z"
    }],
    "overdrafts": []
}
```
Nota: En la respuesta tambien se puede visualizar las devoluciones y prestamos del usuario

### CRUD Actualización de un usuario
**URL**: /users/:id

**MÉTODO**: PUT

- id: es el identificador de un usuario

```
body:
    {
        "email": "joseactualizado@test.com"
    }
Retorna:
    {
        "id": 1,
        "email": "joseactualizado@test.com",
        "created_at": "2021-07-01T06:50:04.902Z",
        "updated_at": "2021-07-01T06:50:04.902Z"
    }
```

### CRUD Eliminación de usuario
**URL**: /users/:id

**MÉTODO**: DELETE
 
- id: es el identificador de un usuario

```
body:
    {
        "email": "joseactualizado@test.com"
    }
Retorna:
    Deleted
```

### Listado de todos los libros
**URL**: /libraries

**MÉTODO**: GET

Retorna:
```
    [{
        "id": 1,
        "title": "libro 1",
        "created_at": "2021-07-01T06:50:04.902Z",
        "updated_at": "2021-07-01T06:50:04.902Z"
    }]
```

### CRUD Creación de libro
**URL**: /libraries

**MÉTODO**: POST

```
body:
    {
        "title": "libro1"
    }
Retorna:
    {
        "id": 1,
        "title": "libro1",
        "created_at": "2021-07-01T06:50:04.902Z",
        "updated_at": "2021-07-01T06:50:04.902Z"
    }
```

### CRUD Consulta de libro
**URL**: /libraries/:id

**MÉTODO**: GET

- id: es el identificador de un libro

Retorna:
```
    {
        "id": 4,
        "title": "libro1",
        "created_at": "2021-07-01T06:50:04.902Z",
        "updated_at": "2021-07-01T06:50:04.902Z"
    }
```

### CRUD Actualización de libro
**URL**: /libraries/:id

**MÉTODO**: PUT

- id: es el identificador de un libro

```
body:
    {
        "title": "new_libro1"
    }
Retorna:
    {
        "id": 4,
        "title": "new_libro1",
        "created_at": "2021-07-01T06:50:04.902Z",
        "updated_at": "2021-07-01T06:50:04.902Z"
    }
```

### CRUD Eliminación de Libro
**URL**: /libraries/:id

**MÉTODO**: DELETE

- id: es el identificador de un libro

```
Retorna:
    Deleted
```

### Préstamo de libro
**URL**: /overdrafts

**MÉTODO**: POST

```  
body:
    {
        "user_id": 1, "library_id": 1
    }
Retorna:
    Préstamo realizado con éxito
```

### Devolución de libro
**URL**: /returns

**MÉTODO**: POST

```   
body:
    {
        "user_id": 1, "library_id": 1
    }
Retorna:
    Devolución realizada con éxito
```

**Notas adicionales:**
 - Este proyecto se encuentra implementado en Heroku
 - Hay una correción pendiente en la palabra Libraries a Books por interpretación del idioma inglés que no afecta la funcionalidad de la API
