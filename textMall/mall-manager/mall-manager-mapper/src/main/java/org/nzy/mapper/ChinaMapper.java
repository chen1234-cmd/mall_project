package org.nzy.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.nzy.pojo.China;
import org.nzy.pojo.ChinaExample;

public interface ChinaMapper {
    int countByExample(ChinaExample example);

    int deleteByExample(ChinaExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(China record);

    int insertSelective(China record);

    List<China> selectByExample(ChinaExample example);

    China selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") China record, @Param("example") ChinaExample example);

    int updateByExample(@Param("record") China record, @Param("example") ChinaExample example);

    int updateByPrimaryKeySelective(China record);

    int updateByPrimaryKey(China record);
}