import request from '@/utils/request'

// 查询医疗设备列表
export function listArmarium(query) {
  return request({
    url: '/system/armarium/list',
    method: 'get',
    params: query
  })
}

// 查询医疗设备详细
export function getArmarium(armariumId) {
  return request({
    url: '/system/armarium/' + armariumId,
    method: 'get'
  })
}

// 新增医疗设备
export function addArmarium(data) {
  return request({
    url: '/system/armarium',
    method: 'post',
    data: data
  })
}

// 修改医疗设备
export function updateArmarium(data) {
  return request({
    url: '/system/armarium',
    method: 'put',
    data: data
  })
}

// 删除医疗设备
export function delArmarium(armariumId) {
  return request({
    url: '/system/armarium/' + armariumId,
    method: 'delete'
  })
}
