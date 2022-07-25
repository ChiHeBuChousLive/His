import request from '@/utils/request'

// 查询进销供应商列表
export function listSupplier(query) {
  return request({
    url: '/net/supplier/list',
    method: 'get',
    params: query
  })
}

// 查询进销供应商详细
export function getSupplier(supplierId) {
  return request({
    url: '/net/supplier/' + supplierId,
    method: 'get'
  })
}

// 新增进销供应商
export function addSupplier(data) {
  return request({
    url: '/net/supplier',
    method: 'post',
    data: data
  })
}

// 修改进销供应商
export function updateSupplier(data) {
  return request({
    url: '/net/supplier',
    method: 'put',
    data: data
  })
}

// 删除进销供应商
export function delSupplier(supplierId) {
  return request({
    url: '/net/supplier/' + supplierId,
    method: 'delete'
  })
}
