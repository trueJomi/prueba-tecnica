import { type Response } from 'express'
import { type WrapperResponse } from '../types/response.type'

function errorResponse (message: string): WrapperResponse<undefined> {
  return {
    status: false,
    message,
    data: undefined
  }
}

function successResponse<T> (data: T): WrapperResponse<T> {
  return {
    status: true,
    message: 'Success',
    data
  }
}

export async function requestResponseCallback<T> (
  res: Response,
  callback: () => Promise<T>
) {
  try {
    const result = await callback()
    res.status(200).json(successResponse(result))
  } catch (error) {
    console.error(error)
    let message = 'Internal Server Error'
    if (error instanceof Error) {
      message = error.message
    }
    res.status(500).json(errorResponse(message))
  }
}
