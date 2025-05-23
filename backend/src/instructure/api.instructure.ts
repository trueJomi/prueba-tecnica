import { URL } from '../constant/urls.constant'
import { type UserResultApi } from '../models/api.model'

export async function getUser (limit: number) {
  const response = await fetch(URL + `?results=${limit}`)
  if (response.status !== 200) {
    throw new Error(`Error ${response.status}: ${response.statusText}`)
  }
  const data: UserResultApi = await response.json()
  return data.results
}
