import { type Result } from '../models/api.model'
import { type User } from '../models/User'

export function adapterToSImpleUser (data: Result): User {
  return {
    nombre: `${data.name.first} ${data.name.last}`,
    genero: data.gender,
    ubicacion: `${data.location.city}, ${data.location.state}, ${data.location.country}`,
    email: data.email,
    fecha_nacimiento: data.dob.date,
    img: data.picture.large
  }
}
