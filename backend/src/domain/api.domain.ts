import { type z } from 'zod'
import { type schemaUsers } from '../validators/users.validate'
import { getUser } from '../instructure/api.instructure'
import { adapterToSImpleUser } from '../adapters/api.adapter'

export async function domainGetUSer (data: z.infer<typeof schemaUsers>) {
  const users = await getUser(data.limit)
  const userSimple = users.map(adapterToSImpleUser)
  return userSimple
}
