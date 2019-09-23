package com.yayo.sys.service.impl;

import com.yayo.base.component.UploadUtil;
import com.yayo.base.utils.PageInfo;
import com.yayo.base.utils.Paging;
import com.yayo.sys.bean.Categories;
import com.yayo.sys.bean.Choice;
import com.yayo.sys.dto.ChoiceDTO;
import com.yayo.sys.dto.ChoiceUpdateDTO;
import com.yayo.sys.mapper.CategoriesMapper;
import com.yayo.sys.mapper.ChoiceMapper;
import com.yayo.sys.service.ChoiceService;
import com.yayo.sys.utils.ReadChoice;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.sound.midi.Soundbank;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/19 11:35
 */
@Service
@Slf4j
public class ChoiceServiceImpl implements ChoiceService {

    @Autowired
    private ChoiceMapper choiceMapper;

    @Autowired
    private CategoriesMapper categoriesMapper;

    @Override
    public Paging<ChoiceDTO> paging(Map<String, Object> params) {
        //查询一级类目
        List<Categories> parents = categoriesMapper.getCategoriesByParentId(0);
        //创建组合对象集
        List<ChoiceDTO> choiceDTOList = new ArrayList<>();
        Integer total = 0;
        //判断类目是否为空
        if(!parents.isEmpty()){
            //查询二级类目
            List<Categories> categoriesList = categoriesMapper.getCategoriesByParentIds(parents);
            //获取页数起止
            PageInfo pageInfo = new PageInfo(Integer.parseInt(params.get("pageNo").toString()),Integer.parseInt(params.get("pageSize").toString()));
            params.put("limit",pageInfo.getLimit());
            params.put("offset",pageInfo.getOffset());
            params.put("categoriesList",categoriesList);
            //查询总条数
            total = choiceMapper.count(params);
            if(total != 0){
                //根据二级类目查询选择题
                List<Choice> choiceList = choiceMapper.list(params);

                //开始拼装
                for(Choice choice : choiceList){
                    //组合对象
                    ChoiceDTO choiceDTO = new ChoiceDTO();
                    choiceDTO.setChoice(choice);
                    //二级类目便利
                    for(Categories categories : categoriesList){
                        //二级类目与选择题匹配
                        if(choice.getCategoriesId().equals(categories.getCategoriesId())){
                            choiceDTO.setCategories2(categories);
                            //一级类目便利
                            for(Categories parent : parents){
                                //一级类目与二级类目匹配
                                if(categories.getCategoriesParent().equals(parent.getCategoriesId())){
                                    choiceDTO.setCategories1(parent);
                                    //如果匹配上，跳出当前循环
                                    break;
                                }
                            }
                            //如果匹配上，跳出当前循环
                            break;
                        }
                    }
                    choiceDTOList.add(choiceDTO);
                }
            }
        }
        Paging paging = new Paging(total,choiceDTOList);
        return paging;
    }

    @Override
    public boolean create(Choice choice) {
        return choiceMapper.create(choice);
    }

    @Override
    public boolean delete(Long choiceId) {
        return choiceMapper.delete(choiceId);
    }

    @Override
    public ChoiceUpdateDTO getChoiceById(Long choiceId) {
        Choice choice = choiceMapper.findById(choiceId);
        ChoiceUpdateDTO choiceUpdateDTO = new ChoiceUpdateDTO();
        BeanUtils.copyProperties(choice,choiceUpdateDTO);
        return choiceUpdateDTO;
    }

    @Override
    public boolean update(Choice choice) {
        return choiceMapper.update(choice);
    }

    @Override
    public Map<String, String> uploadAndRead(MultipartFile file) {
        //保存上传文件
        Map<String,String> result =  UploadUtil.upload(file,"F:/my-book/choice/");
        //读取上传文件
        if("0".equals(result.get("code"))){
            String path = result.get("path");
            int rowNo = 0;
            try{
                File readFile = new File(result.get("path"));
                InputStream is = new FileInputStream(readFile);
                XSSFWorkbook wb = new XSSFWorkbook (is);
                XSSFSheet sheet = wb.getSheetAt(0);
                //行的索引数，从0开始，rowNo + 1 就是总行数
                rowNo = sheet.getLastRowNum();
                try {
                    //分析Excel
                    Map<String,Object> excelResult = ReadChoice.readExcel(sheet);
                    log.info("Excel:{}",excelResult);
                    if(!"0".equals(excelResult.get("successCount"))){
                        log.info("开始批量更新");
                        //批量更新
                        List<ChoiceUpdateDTO> list = (List<ChoiceUpdateDTO>) excelResult.get("list");
                        boolean insertResult = choiceMapper.insertBatch(list);
                        log.info("批量更新结束");
                    }
                } catch (Exception e) {
                    log.error("parsing excel error,catch:{}",e.getMessage());
                    e.printStackTrace();
                }
            } catch (Exception e) {
                log.error("It is a bad Excel Url, catch:{}",e.getMessage());
                e.printStackTrace();
            }
        }
        return result;
    }


    public static void main(String[] args) {
        ChoiceServiceImpl choice = new ChoiceServiceImpl();

    }


}
