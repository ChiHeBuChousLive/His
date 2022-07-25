import request from '@/utils/request'

// 查询进销药品信息维护列表
export function listDrug(query) {
  return request({
    url: '/net/drug/list',
    method: 'get',
    params: query
  })
}

// 查询进销药品信息维护详细
export function getDrug(drugId) {
  return request({
    url: '/net/drug/' + drugId,
    method: 'get'
  })
}

// 新增进销药品信息维护
export function addDrug(data) {
  return request({
    url: '/net/drug',
    method: 'post',
    data: data
  })
}

// 修改进销药品信息维护
export function updateDrug(data) {
  return request({
    url: '/net/drug',
    method: 'put',
    data: data
  })
}

// 删除进销药品信息维护
export function delDrug(drugId) {
  return request({
    url: '/net/drug/' + drugId,
    method: 'delete'
  })
}

