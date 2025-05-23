import { appInit } from './libs/app'
import { apiRouter } from './routes/api.route'

appInit(apiRouter, 3000)
