package com.myport.task;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.myport.domain.AttachImageVO;
import com.myport.mapper.AdminMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TaskTest {

	@Autowired
	private AdminMapper mapper;

	private String getFolderYesterDay() {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Calendar cal = Calendar.getInstance();

		cal.add(Calendar.DATE, -1);

		String str = sdf.format(cal.getTime());

		return str.replace("-", File.separator);
	}

	@Test
	public void taskTests() {
		List<AttachImageVO> fileList = mapper.checkFileList();

		System.out.println("fileList : ");
		fileList.forEach(list -> System.out.println(list));
		System.out.println("========================================");

		List<Path> checkFilePath = new ArrayList<Path>();

		fileList.forEach(vo -> {
			Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
			checkFilePath.add(path);
		});

		System.out.println("checkFilePath : ");
		checkFilePath.forEach(list -> System.out.println(list));
		System.out.println("========================================");

		fileList.forEach(vo -> {
			Path path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName());
			checkFilePath.add(path);
		});

		System.out.println("checkFilePath(����� �̹��� ���� �߰� ��) : ");
		checkFilePath.forEach(list -> System.out.println(list));
		System.out.println("========================================");

		File targetDir = Paths.get("C:\\upload", getFolderYesterDay()).toFile();
		File[] targetFile = targetDir.listFiles();

		System.out.println("targetFile : ");
		for (File file : targetFile) {
			System.out.println(file);
		}
		System.out.println("========================================");
		
		
		List<File> removeFileList = new ArrayList<File>(Arrays.asList(targetFile));

		System.out.println("removeFileList(���� ��) : ");
		removeFileList.forEach(file -> {
			System.out.println(file);
		});
		System.out.println("========================================");

		for (File file : targetFile) {
			checkFilePath.forEach(checkFile -> {
				if (file.toPath().equals(checkFile))
					removeFileList.remove(file);
			});
		}

		System.out.println("removeFileList(���� ��) : ");
		removeFileList.forEach(file -> {
			System.out.println(file);
		});
		System.out.println("========================================");
		
		/* ���� ���� */
		for(File file : removeFileList) {
			System.out.println("���� : " + file);
			file.delete();
		}
	}

}
