import express from 'express'
import cors from 'cors'
import YMAL from 'yamljs'
import swaggerUi from 'swagger-ui-express'
import { json, urlencoded } from 'body-parser'
import { type Router } from 'express'

export function setupApp () {
  const app = express()
  app.use(
    cors({
      origin: true,
      methods: ['GET', 'POST', 'PUT', 'DELETE'],
      allowedHeaders: [
        'Origin',
        'X-Requested-With',
        'Content-Type',
        'Accept',
        'Authorization'
      ]
    })
  )
  app.use(express.json())
  app.use(express.urlencoded({ extended: true }))
  app.use(json())
  app.use(urlencoded({ extended: true }))
  return app
}

export function appInit (
  router: Router,
  port: number,
  name?: string
) {
  const app = setupApp()
  app.use(router)
  if (name !== undefined) {
    const swaggerDocs: swaggerUi.JsonObject = YMAL.load(
        `./src/docs/${name}.yaml`
    )
    console.log('Swagger docs loaded')
    app.use('/docs', swaggerUi.serve, swaggerUi.setup(swaggerDocs))
  }
  app.listen(port, () => {
    console.log(`Server running on port ${port}`)
  })
}
