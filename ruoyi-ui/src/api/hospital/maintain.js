import request from '@/utils/request'

// 查询医疗设备维修列表
export function listMaintain(query) {
  return request({
    url: '/system/maintain/list',
    method: 'get',
    params: query
  })
}

// 查询医疗设备维修详细
export function getMaintain(maintainId) {
  return request({
    url: '/system/maintain/' + maintainId,
    method: 'get'
  })
}

// 新增医疗设备维修
export function addMaintain(data) {
  return request({
    url: '/system/maintain',
    method: 'post',
    data: data
  })
}

// 修改医疗设备维修
export function updateMaintain(data) {
  return request({
    url: '/system/maintain',
    method: 'put',
    data: data
  })
}

// 删除医疗设备维修
export function delMaintain(maintainId) {
  return request({
    url: '/system/maintain/' + maintainId,
    method: 'delete'
  })
}
