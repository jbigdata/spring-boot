package com.wanliang.site.service;

import com.wanliang.site.common.persistence.DataEntity;
import com.wanliang.site.common.persistence.Page;
import com.wanliang.site.repository.BaseReository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by wanliang on 2015/8/8.
 */
public abstract class BaseService<D extends BaseReository<T>, T extends DataEntity<T>> {

    /**
     * 持久层对象
     */
    @Autowired
    protected D dao;

    /**
     * 获取单条数据
     * @param id
     * @return
     */
    public T get(String id) {
        return dao.get(id);
    }

    /**
     * 获取单条数据
     * @param entity
     * @return
     */
    public T get(T entity) {
        return dao.get(entity);
    }

    /**
     * 查询列表数据
     * @param entity
     * @return
     */
    public List<T> findList(T entity) {
        return dao.findList(entity);
    }

    /**
     * 查询分页数据
     * @param page 分页对象
     * @param entity
     * @return
     */
    public Page<T> findPage(Page<T> page, T entity) {
        entity.setPage(page);
        page.setList(dao.findList(entity));
        return page;
    }

    /**
     * 保存数据（插入或更新）
     * @param entity
     */
    @Transactional(readOnly = false)
    public void save(T entity) {
        if (entity.getIsNewRecord()){
        //  entity.preInsert();
            dao.insert(entity);
        }else{
           // entity.preUpdate();
            dao.update(entity);
        }
    }

    /**
     * 删除数据
     * @param entity
     */
    @Transactional(readOnly = false)
    public void delete(T entity) {
        dao.delete(entity);
    }

    /**
     * 批量插入
     * @param list
     */
    @Transactional(readOnly = false)
    public void batchSave(List<T> list){
        dao.batchSave(list);
    }
}
