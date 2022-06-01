package com.myport.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.myport.domain.AttachImageVO;
import com.myport.mapper.AdminMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Component
@Log4j
@AllArgsConstructor
public class AttachFileCheckTask {
	
	private AdminMapper mapper;
	
private String getFolderYesterDay() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		Calendar cal = Calendar.getInstance();
		
		cal.add(Calendar.DATE, -1);
		
		String str = sdf.format(cal.getTime());
		
		return str.replace("-", File.separator);
	}	
	
	@Scheduled(cron="0 0 1 * * *")
	public void checkFiles() throws Exception{	
		
		log.warn("File Check Task Run..........");
		log.warn(new Date());
		log.warn("========================================");		
		
		// DB�� ����� ���� ����Ʈ
		List<AttachImageVO> fileList = mapper.checkFileList();		
		
		
		// �� ���� ���� ����Ʈ(Path��ü)
		List<Path> checkFilePath = new ArrayList<Path>();
			//���� �̹���
		fileList.forEach(vo -> {
			Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
			checkFilePath.add(path);
		});		
			//����� �̹���
		fileList.forEach(vo -> {
			Path path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" +  vo.getUuid() + "_" + vo.getFileName());
			checkFilePath.add(path);
		});
		
		
		// ���丮 ���� ����Ʈ
		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();
		File[] targetFile = targetDir.listFiles();
		
		
		// ���� ��� ���� ����Ʈ(�з�)
		List<File> removeFileList = new ArrayList<File>(Arrays.asList(targetFile));		
		for(File file : targetFile){
			checkFilePath.forEach(checkFile ->{
				if(file.toPath().equals(checkFile)) 
					removeFileList.remove(file);	
			});
		}
		
		
		// ���� ��� ���� ����
		log.warn("file Delete : ");
		for(File file : removeFileList) {
			log.warn(file);
			file.delete();
		}		
		
		log.warn("========================================");
		
	}
}
