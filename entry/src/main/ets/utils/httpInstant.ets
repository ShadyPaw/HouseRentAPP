import axios, { AxiosError, AxiosInstance, AxiosResponse } from '@ohos/axios'

//创建axios的实例
export const httpInstance:AxiosInstance = axios.create({
  baseURL: "http://localhost:3000",
  timeout: 5000,
  headers: {
    "Content-Type": "application/json"
  }
})

httpInstance.interceptors.response.use(
  (response: AxiosResponse) => {
    // 对响应数据做点什么
    return response;
  },
  (error: AxiosError) => {
    // 对响应错误做点什么
    return Promise.reject(error);
  }
);

/**
 * url:请求路径
 * */
export async function getDataList(url: string) {
  try {
    const response: AxiosResponse = await httpInstance.get(url);
    return response.data;
  } catch (error) {
    console.error('Error fetching data:', error);
    throw new Error('请求出错惹');
  }
}