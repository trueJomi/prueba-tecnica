import { API_URL } from "../constant/env.constant"
import { FetchApi } from "../libs/fetch"
import type { User } from "../models/User.model"

const api =new FetchApi(API_URL)

export async function getUsers() {
    return await api.GET<User[]>('/api',{
        limit: "10"
    })
}