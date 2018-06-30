package com.police.testing.tools;

import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.police.testing.pojo.TestingLog;

public class ExportFile {
	/**
	 * 导出考试记录
	 * @param list
	 * @param beginDate
	 * @param endDate
	 * @param request
	 * @param response
	 */
	public static void exportByTestingLog(List<TestingLog> list, String testPaperName, String beginDate, String endDate,
			HttpServletRequest request, HttpServletResponse response){
		//第一步：解决excel表头字段问题
		try {
			XSSFWorkbook workBook = new XSSFWorkbook();
			XSSFSheet sheet = workBook.createSheet();
			workBook.setSheetName(0, "考试成绩");// 工作簿名称
			XSSFFont font = workBook.createFont();
			font.setColor(XSSFFont.COLOR_NORMAL);
//			font.setBoldweight(XSSFFont.BOLDWEIGHT_BOLD);
			XSSFCellStyle cellStyle = workBook.createCellStyle();// 创建格式
			cellStyle.setFont(font);
//			cellStyle.setAlignment(XSSFCellStyle。);
//			cellStyle.setVerticalAlignment(XSSFCellStyle.VERTICAL_CENTER);
			// 创建第一行标题
			XSSFRow titleRow = sheet.createRow((short) 0);
			Integer titleColumnNubmer = 0;
			//负责人
			sheet.setColumnWidth(titleColumnNubmer, 5000);
			XSSFCell cellPrincipal = titleRow.createCell(titleColumnNubmer,0);
			cellPrincipal.setCellStyle(cellStyle);
			cellPrincipal.setCellValue("姓名");
			titleColumnNubmer ++;
			//上传量
			sheet.setColumnWidth(titleColumnNubmer, 5000);
			XSSFCell cellUploadCount = titleRow.createCell(titleColumnNubmer,0);
			cellUploadCount.setCellStyle(cellStyle);
			cellUploadCount.setCellValue("证件号");
			titleColumnNubmer ++;
			//外呼数量
			sheet.setColumnWidth(titleColumnNubmer, 5000);
			XSSFCell cellCallCount = titleRow.createCell(titleColumnNubmer,0);
			cellCallCount.setCellStyle(cellStyle);
			cellCallCount.setCellValue("所属派出所");
			titleColumnNubmer ++;
			//接通量
			sheet.setColumnWidth(titleColumnNubmer, 5000);
			XSSFCell cellConnectCount = titleRow.createCell(titleColumnNubmer,0);
			cellConnectCount.setCellStyle(cellStyle);
			cellConnectCount.setCellValue("试卷名称");
			titleColumnNubmer ++;
			//接通率
			sheet.setColumnWidth(titleColumnNubmer, 5000);
			XSSFCell cellConnetProbability = titleRow.createCell(titleColumnNubmer,0);
			cellConnetProbability.setCellStyle(cellStyle);
			cellConnetProbability.setCellValue("分数");
			titleColumnNubmer ++;
			//IP
			sheet.setColumnWidth(titleColumnNubmer, 5000);
			XSSFCell cellIp = titleRow.createCell(titleColumnNubmer,0);
			cellIp.setCellStyle(cellStyle);
			cellIp.setCellValue("ip");
			titleColumnNubmer ++;
			//给数据表添加数据
			for (int i = 0; i< list.size(); i++) {
				TestingLog testingLog = list.get(i);
				//初始化数据行号
				XSSFRow valuerow = sheet.createRow((short) i + 1);
				Integer valueNumber = 0;
				//手工添加导出数据自定义部分的数据
				//姓名
				sheet.setColumnWidth(valueNumber, 5000);
				XSSFCell cellDatauserName = valuerow.createCell(valueNumber,0);
				cellDatauserName.setCellStyle(cellStyle);
				String userName = testingLog.getUserName();
				cellDatauserName.setCellValue(userName.toString());
				valueNumber ++;
				//证件号
				sheet.setColumnWidth(valueNumber, 5000);
				XSSFCell cellDatauserId = valuerow.createCell(valueNumber,0);
				cellDatauserId.setCellStyle(cellStyle);
				String userId = testingLog.getUserId();
				cellDatauserId.setCellValue(userId.toString());
				valueNumber++;
				//所属派出所
				sheet.setColumnWidth(valueNumber, 5000);
				XSSFCell cellDataDepartmentName = valuerow.createCell(valueNumber,0);
				cellDataDepartmentName.setCellStyle(cellStyle);
				String departmentName = testingLog.getDepartmentName();
				cellDataDepartmentName.setCellValue(departmentName);
				valueNumber++;
				//试卷名称
				sheet.setColumnWidth(valueNumber, 5000);
				XSSFCell cellDataTestPaperName = valuerow.createCell(valueNumber);
				cellDataTestPaperName.setCellStyle(cellStyle);
				cellDataTestPaperName.setCellValue(testPaperName);
				valueNumber++;
				//分数
				sheet.setColumnWidth(valueNumber, 5000);
				XSSFCell cellDataSorce = valuerow.createCell(valueNumber,0);
				cellDataSorce.setCellStyle(cellStyle);
				String sorce = String.valueOf(testingLog.getScore());
				cellDataSorce.setCellValue(sorce.toString());
				valueNumber++;
				//IP
				sheet.setColumnWidth(valueNumber, 5000);
				XSSFCell cellDataIp = valuerow.createCell(valueNumber,0);
				cellDataIp.setCellStyle(cellStyle);
				String ip = null;
				if(StringUtils.isBlank(testingLog.getIp())){
					ip = "";
				}else {
					ip = testingLog.getIp();
				}
				cellDataIp.setCellValue(ip);
				valueNumber++;
			}
			/***
			 * Web形式输出Excel
			 */
			String exportFileName = "考试成绩.xlsx";
//			//输出Excel文件  
//			FileOutputStream output=new FileOutputStream("d:\\考试成绩.xls");  
//			workBook.write(output);  
//			output.flush();
			// 表示以附件的形式把文件发送到客户端
			response.setHeader("Content-Disposition", "attachment;filename=" + new String((exportFileName).getBytes(), "ISO-8859-1"));// 设定输出文件头
			response.setContentType("application/x-msdownload;charset=UTF-8");// 定义输出类型
			// 通过response的输出流把工作薄的流发送浏览器形成文件
			OutputStream outStream = response.getOutputStream();
			workBook.write(outStream);
			outStream.flush();
			outStream.close();
		} catch (Exception e) {
			System.out.println("文件导出发生异常！异常原因：" + e.getMessage());
			e.printStackTrace();
		}
	}
}
