import request from '@/utils/request'

// 查询进销生产厂家列表
export function listProduction(query) {
  return request({
    url: '/net/production/list',
    method: 'get',
    params: query
  })
}

// 查询进销生产厂家详细
export function getProduction(productionId) {
  return request({
    url: '/net/production/' + productionId,
    method: 'get'
  })
}

// 新增进销生产厂家
export function addProduction(data) {
  return request({
    url: '/net/production',
    method: 'post',
    data: data
  })
}

// 修改进销生产厂家
export function updateProduction(data) {
  return request({
    url: '/net/production',
    method: 'put',
    data: data
  })
}

// 删除进销生产厂家
export function delProduction(productionId) {
  return request({
    url: '/net/production/' + productionId,
    method: 'delete'
  })
}
