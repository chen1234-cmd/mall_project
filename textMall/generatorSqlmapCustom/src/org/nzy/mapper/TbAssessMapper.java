package org.nzy.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.nzy.pojo.TbAssess;
import org.nzy.pojo.TbAssessExample;

public interface TbAssessMapper {
    int countByExample(TbAssessExample example);

    int deleteByExample(TbAssessExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TbAssess record);

    int insertSelective(TbAssess record);

    List<TbAssess> selectByExample(TbAssessExample example);

    TbAssess selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TbAssess record, @Param("example") TbAssessExample example);

    int updateByExample(@Param("record") TbAssess record, @Param("example") TbAssessExample example);

    int updateByPrimaryKeySelective(TbAssess record);

    int updateByPrimaryKey(TbAssess record);
}