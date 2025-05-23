import { type Request, type Response } from 'express'
import { requestResponseCallback } from '../libs/responses'
import { schemaUsers } from '../validators/users.validate'
import { domainGetUSer } from '../domain/api.domain'

export async function reqGetUsers (req: Request, res: Response) {
  await requestResponseCallback(res, async () => {
    const body = schemaUsers.parse(req.query)
    const users = await domainGetUSer(body)
    return users
  })
}
