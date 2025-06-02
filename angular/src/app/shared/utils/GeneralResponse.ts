export interface GeneralResponse<T=any> {
  flag: boolean,
  message: string,
  payload: T | null,
  errors: { [key: string]: string[] }
}
