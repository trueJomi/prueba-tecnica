import { z } from 'zod'

export const schemaUsers = z.object({
  limit: z.coerce.number().int()
})
