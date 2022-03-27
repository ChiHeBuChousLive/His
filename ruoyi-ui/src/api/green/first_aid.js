import request from '@/utils/request'

// 查询紧急救治（关联病历与药物）列表
export function listAid(query) {
  return request({
    url: '/green/first_aid/list',
    method: 'get',
    params: query
  })
}

// 查询紧急救治（关联病历与药物）详细
export function getAid(aidId) {
  return request({
    url: '/green/first_aid/' + aidId,
    method: 'get'
  })
}

// 新增紧急救治（关联病历与药物）
export function addAid(data) {
  return request({
    url: '/green/first_aid',
    method: 'post',
    data: data
  })
}

// 修改紧急救治（关联病历与药物）
export function updateAid(data) {
  return request({
    url: '/green/first_aid',
    method: 'put',
    data: data
  })
}

// 删除紧急救治（关联病历与药物）
export function delAid(aidId) {
  return request({
    url: '/green/first_aid/' + aidId,
    method: 'delete'
  })
}
