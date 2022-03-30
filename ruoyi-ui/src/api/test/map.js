import request from '@/utils/request'
//查询老人和最近的诊所

export function listOld() {
  return request({
    url: '/testMap/map/getOldAndClinic',
    method: 'get',
  })
}
//查询所有诊所
export function listClinic() {
  return request({
    url: '/testMap/map/getClinicList',
    method: 'get',
  })
}





