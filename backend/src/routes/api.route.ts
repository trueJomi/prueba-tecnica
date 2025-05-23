import { Router } from 'express'
import { reqGetUsers } from '../controllers/example.controller'

export const apiRouter = Router()

apiRouter.get('/api', reqGetUsers)
