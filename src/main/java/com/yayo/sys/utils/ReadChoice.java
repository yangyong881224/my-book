package com.yayo.sys.utils;

import com.yayo.base.component.ReadExcelUtil;
import com.yayo.sys.dto.ChoiceUpdateDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: Yayo
 * @Description:
 * @Created at: 2019/9/20 23:51
 */
@Slf4j
public class ReadChoice {

    /**
     * 分析Excel 返分析结果
     * @param filePath
     * @throws Exception
     */
    public static Map<String,Object> readExcel(String filePath) throws IOException {

        File readFile = new File(filePath);
        InputStream is = new FileInputStream(readFile);
        XSSFWorkbook wb = new XSSFWorkbook (is);
        XSSFSheet sheet = wb.getSheetAt(0);
        //行的索引数，从0开始，rowNo + 1 就是总行数
        int rowNo = sheet.getLastRowNum();
        int count = 0;

        //返回Map
        Map<String,Object> result = new HashMap<>();
        List<ChoiceUpdateDTO> list = new ArrayList<>();
        //循环读取excel数据

        int successCount = 0;//成功条数
        int errorCount = 0;//错误条数
        String errorMsg = "";
        for (Row row : sheet) {
            //从第二行开始读取数据
            if(count < 1){
                count++;
                continue;
            }
            //如果当前行没有数据，跳出循环
            if(row.getCell(0).toString().equals("")){
                break;
            }
            try {
                ChoiceUpdateDTO choice = ReadChoice.readToChoice(row);
                successCount ++;
                list.add(choice);
            } catch (Exception e) {
                errorCount ++;
                //日志记录当前错误信息和Excel错误行序号
                log.error("读取Excel失败:{} ,出错问题内容:{}",e.getMessage(),row.getCell(0)==null?"问题为空":ReadExcelUtil.getValue(row.getCell(0)));
                e.printStackTrace();
                //判断errorMsg是否为空，若为空则添加，若非空则追加
                errorMsg += StringUtils.isNotEmpty(errorMsg)?","+ReadExcelUtil.getValue(row.getCell(0)):"错误行问题："+ReadExcelUtil.getValue(row.getCell(0)).toString();
            }
        }
        result.put("list", list);
        result.put("successCount",successCount);
        result.put("errorCount",errorCount);
        result.put("errorMsg",errorMsg);
        return result;
    }

    public static ChoiceUpdateDTO readToChoice(Row row){
        ChoiceUpdateDTO choice = new ChoiceUpdateDTO();
        //如果row.getCell得到的结果为null，则会发生异常
        String a = ReadExcelUtil.getValue(row.getCell(0)).toString();
        String b = ReadExcelUtil.getValue(row.getCell(1)).toString();
        String c = ReadExcelUtil.getValue(row.getCell(2)).toString();
        String d = ReadExcelUtil.getValue(row.getCell(3))==null?"":ReadExcelUtil.getValue(row.getCell(3)).toString();
        String e = ReadExcelUtil.getValue(row.getCell(4))==null?"":ReadExcelUtil.getValue(row.getCell(4)).toString();
        String f = ReadExcelUtil.getValue(row.getCell(5)).toString();
        String g = ReadExcelUtil.getValue(row.getCell(6)).toString();
        String h = ReadExcelUtil.getValue(row.getCell(7)).toString();
        Map<Object,Object> answerMap = new HashMap<>();
        answerMap.put("A",b);
        answerMap.put("B",c);
        if(StringUtils.isNotBlank(d))
            answerMap.put("C",d);
        if(StringUtils.isNotBlank(e))
            answerMap.put("D",e);

        choice.setChoiceQuestion(a);
        choice.setAnswerMap(answerMap);
        choice.setChoiceType((int)Double.parseDouble(f));
        choice.setChoiceTrue(g);
        choice.setCategoriesId((int)Double.parseDouble(h));
        return choice;
    }
}
