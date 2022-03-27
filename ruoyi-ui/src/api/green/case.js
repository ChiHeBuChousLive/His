import request from '@/utils/request'

// 查询病例管理列表
export function listCase(query) {
  return request({
    url: '/green/case/list',
    method: 'get',
    params: query
  })
}

// 查询病例管理详细
export function getCase(caseId) {
  return request({
    url: '/green/case/' + caseId,
    method: 'get'
  })
}

// 新增病例管理
export function addCase(data) {
  return request({
    url: '/green/case',
    method: 'post',
    data: data
  })
}

// 修改病例管理
export function updateCase(data) {
  return request({
    url: '/green/case',
    method: 'put',
    data: data
  })
}

// 删除病例管理
export function delCase(caseId) {
  return request({
    url: '/green/case/' + caseId,
    method: 'delete'
  })
}
