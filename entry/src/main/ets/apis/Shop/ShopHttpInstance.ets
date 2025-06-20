import { AxiosResponse } from '@ohos/axios';
import { getDataList } from '../../utils/httpInstant';

const url: string = '/api/merchant'
export const getShopList =getDataList(url).then((result: AxiosResponse) => {
  AppStorage.set('shopList', result)
})

