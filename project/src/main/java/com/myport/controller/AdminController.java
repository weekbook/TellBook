package com.myport.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.myport.domain.AttachImageVO;
import com.myport.domain.AuthorVO;
import com.myport.domain.BookVO;
import com.myport.domain.CateVO;
import com.myport.domain.Criteria;
import com.myport.domain.MemberVO;
import com.myport.domain.OrderCancleDTO;
import com.myport.domain.OrderDTO;
import com.myport.domain.PageDTO;
import com.myport.service.AdminService;
import com.myport.service.AuthorService;
import com.myport.service.MemberService;
import com.myport.service.OrderService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;

@Log4j
@Controller
@RequestMapping("/admin")
@AllArgsConstructor
public class AdminController {

	private AuthorService authorService;

	private AdminService adminService;
	
	private OrderService orderService;
	
	private MemberService memberService;

	// 관리자 메인 페이지 이동
	@GetMapping("/main")
	public void adminMainGET() throws Exception {
		log.info("관리자 페이지 이동");
	}

	// 상품 관리 페이지 접속
	@GetMapping("/goodsManage")
	public void goodsManageGET(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info("상품 관리 페이지 접속");
		
		List<BookVO> list = adminService.goodsGetList(cri);
		
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
			return;
		}
		model.addAttribute("pageMaker", new PageDTO(cri, adminService.goodsGetTotal(cri)));
	}

	// 상품 등록 페이지 접속
	@GetMapping("/goodsEnroll")
	public void goodsEnrollGET(Model model) throws Exception {
		log.info("상품 등록 페이지 접속");
		
		// jackson-databind메서드는 static메서드가 아니기 때문에 인스턴스화하여 사용해야함.
		ObjectMapper objm = new ObjectMapper();
		
		List<CateVO> list = adminService.cateList();
		
		// 자바 객체를 String 타입의 JSON형식 데이터로 변환
		String cateList = objm.writeValueAsString(list);
		
		model.addAttribute("cateList", cateList);
		
//		log.info("변경 전" + list);
//		log.info("변경 후" + cateList);
	}
	
	// 상품 조회 페이지
	@GetMapping({"/goodsDetail","/goodsModify"})
	public void goodsGetInfoGET(int bookId, @ModelAttribute("cri") Criteria cri, Model model) throws JsonProcessingException {
		log.info("goodsGetInfo..." + bookId);
		
		ObjectMapper mapper = new ObjectMapper();
		
		// 카테고리 리스트 데이터
		model.addAttribute("cateList", mapper.writeValueAsString(adminService.cateList()));
		
//		model.addAttribute("cri",cri);
		
		model.addAttribute("goodsInfo", adminService.goodsGetDetail(bookId));
	}
	
	// 상품 등록
		@PostMapping("/goodsEnroll")
		public String authorModifyPOST(BookVO book, RedirectAttributes rttr) throws Exception {
			log.info("goodsEnrollPOST...." + book);

			adminService.bookEnroll(book);

			rttr.addFlashAttribute("enroll_result", book.getBookName());

			return "redirect:/admin/goodsManage";
		}
	
	// 상품 수정
	@PostMapping("/goodsModify")
	public String goodsModifyPOST(BookVO vo, RedirectAttributes rttr) {
		log.info("goodsModifyPOST .." + vo);
		int result = adminService.goodsModify(vo);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/admin/goodsManage";
	}
	
	// 상품 삭제
	@PostMapping("/goodsDelete")
	public String goodsDeletePOST(int bookId, RedirectAttributes rttr) {
		log.info("goodsDelete..." + bookId);
		
		List<AttachImageVO> fileList = adminService.getAttachInfo(bookId);
		if(fileList != null) {
			List<Path> pathList = new ArrayList();
			
			fileList.forEach(vo ->{
				// 원본 이미지
				Path path = Paths.get("C:\\upload", vo.getUploadPath(), vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);
				
				// 섬네일 이미지
				path = Paths.get("C:\\upload", vo.getUploadPath(), "s_" + vo.getUuid() + "_" + vo.getFileName());
				pathList.add(path);
			});
			
			pathList.forEach(path ->{
				path.toFile().delete();
			});
		}
		
		int result = adminService.goodsDelete(bookId);
		rttr.addFlashAttribute("delete_result", result);
		return "redirect:/admin/goodsManage";
	}

	// 작가 등록 페이지 접속
	@GetMapping("/authorEnroll")
	public void authorEnrollGET() throws Exception {
		log.info("작가 등록 페이지 접속");
	}

	// 작가 관리 페이지 접속
	@GetMapping("/authorManage")
	public void authorManageGET(Criteria cri, Model model) throws Exception {
		log.info("작가 관리 페이지 접속");

		// 작가 목록 출력 데이터
		List<AuthorVO> list = authorService.authorGetList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
		}

		// 페이지 이동 인터페이스 데이터
		int total = authorService.authorGetTotal(cri);

		PageDTO pageMaker = new PageDTO(cri, total);

		model.addAttribute("pageMaker", pageMaker);
	}

	// 작가 등록
	@PostMapping("/authorEnroll.do")
	public String authorEnrollPOST(AuthorVO author, RedirectAttributes rttr) throws Exception {
		log.info("authorEnroll : " + author);

		authorService.authorEnroll(author);

		rttr.addFlashAttribute("enroll_result", author.getAuthorName());

		return "redirect:/admin/authorManage";
	}

	// 작가 상세 페이지
	@GetMapping({ "/authorDetail", "/authorModify" })
	public void authorGetInfoGET(int authorId, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info("authorDetail..." + authorId);

		// 페이지 정보
//		model.addAttribute("cri" + cri);

		// 선택 작가 정보
		model.addAttribute("authorInfo", authorService.authorGetDetail(authorId));

	}

	// 작가 정부 수정
	@PostMapping("/authorModify")
	public String authorModifyPOST(AuthorVO author, RedirectAttributes rttr) throws Exception {
		log.info("authorModifyPOSY" + author);
		int result = authorService.authorModify(author);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/admin/authorManage";
	}

	// 작가 삭제
	@PostMapping("/authorDelete")
	public String authorDeletePOST(int authorId, RedirectAttributes rttr) throws Exception{
		log.info("authorDeletePOST..");
		int result = 0;
		try {
			result = authorService.authorDelete(authorId);
		} catch (Exception e) {
			e.printStackTrace();
			result = 2;
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/admin/authorManage";
		}
		
		rttr.addFlashAttribute("delete_result",result);
		return "redirect:/admin/authorManage";
	}

	// 작가 검색 팝업창
	@GetMapping("/authorPop")
	public void authorPopGET(Criteria cri, Model model) throws Exception {
		log.info("authorPopGET......");
		
		// 작가 목록 출력 데이터
		List<AuthorVO> list = authorService.authorGetList(cri);

		if (!list.isEmpty()) {
			model.addAttribute("list", list);
		} else {
			model.addAttribute("listCheck", "empty");
		}
		
		model.addAttribute("pageMaker", new PageDTO(cri, authorService.authorGetTotal(cri)));
	}

	// 첨부 파일 업로드
	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<List<AttachImageVO>> uploadAjaxActionPOST(MultipartFile[] uploadFile) {
		log.info("uploadAjaxActionPOST..");
		
		// 이미지 파일 체크
		for(MultipartFile multipartFile: uploadFile) {
			File checkFile = new File(multipartFile.getOriginalFilename());
			String type = null;
			
			// pprobeContentType : 파라미터로 전달받은 파일의 MIME TYPE을 문자열로 반환해주는 메서드
			try {
				type = Files.probeContentType(checkFile.toPath());
				log.info("MIME TYPE : " + type);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(!type.startsWith("image")) {
				List<AttachImageVO> list = null;
				return new ResponseEntity<>(list, HttpStatus.BAD_REQUEST);
			}
		}
		
		String uploadFolder = "C:\\upload";
		
		// 날짜 폴더 경로
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		String datePath = str.replace("-", File.separator);
		
		// 폴더 생성
		File uploadPath = new File(uploadFolder, datePath);
		log.info(uploadPath);
		if(uploadPath.exists()== false) {
			uploadPath.mkdirs();
		}
		
		// 이미지 정보 담는 객체
		List<AttachImageVO> list = new ArrayList<>();
		
		for(MultipartFile multipartFile : uploadFile) {
			// 이미지 정보 객체
			AttachImageVO vo = new AttachImageVO();
			
			// 파일 이름
			String uploadFileName = multipartFile.getOriginalFilename();
			vo.setFileName(uploadFileName);
			vo.setUploadPath(datePath);
			
			// uuid 적용 파일 이름
			String uuid = UUID.randomUUID().toString();
			vo.setUuid(uuid);
			uploadFileName = uuid + "_" + uploadFileName;
			
			
			// 파일 저장
			try {
				// 파일 위치, 파일 이름을 합친 File 객체
				File saveFile = new File(uploadPath, uploadFileName);
				multipartFile.transferTo(saveFile);
				log.info("test" + uploadPath);
				log.info("test" + uploadFileName);
				
				// 썸네일 생성(ImageIO)
//				File thumbnailFile = new File(uploadPath, "s_" + uploadFileName);
//				
//				BufferedImage bo_image = ImageIO.read(saveFile);
//				
//				// 비율
//				double ratio = 3;
//				// 넓이 높이
//				int width = (int) (bo_image.getWidth()/ratio);
//				int height = (int) (bo_image.getHeight()/ratio);
//				
//				BufferedImage bt_image = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);
//				
//				Graphics2D graphic = bt_image.createGraphics();
//				
//				graphic.drawImage(bo_image, 0, 0, width, height, null);
//				
//				ImageIO.write(bt_image, "jpg", thumbnailFile);
				
				// 방법 2
				File thumbnailFile = new File(uploadPath,"s_" + uploadFileName);
				
				BufferedImage bo_image = ImageIO.read(saveFile);
				
				double ratio = 3;
				// 넓이 높이
				int width = (int) (bo_image.getWidth()/ratio);
				int height = (int) (bo_image.getHeight()/ratio);
				
				Thumbnails.of(saveFile).size(width, height).toFile(thumbnailFile);
				
			} catch (FileNotFoundException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			list.add(vo);
		}
		
		ResponseEntity<List<AttachImageVO>> result = new ResponseEntity<List<AttachImageVO>>(list, HttpStatus.OK);
		
		return result;
		
	}
	
	// 이미지 파일 삭제
	@PostMapping("/deleteFile")
	public ResponseEntity<String> deleteFile(String fileName){
		log.info("deletefile..." + fileName);
		
		File file = null;
		
		try {
			// 썸네일 파일 삭제
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));
			file.delete();
			
			// 원본 파일 삭제
			String originFileName = file.getAbsolutePath().replaceFirst("s_", "");
			log.info("originFileName : " + originFileName);
			file = new File(originFileName);
			file.delete();
			
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<String>("fail", HttpStatus.NOT_IMPLEMENTED);
		}
		
		return new ResponseEntity<String>("success", HttpStatus.OK);
	}
	
	// 주문 현황 페이지
	@GetMapping("/orderList")
	public String orderListGET(Criteria cri, Model model) {
		
		List<OrderDTO> list = adminService.getOrderList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageDTO(cri, adminService.getOrderTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}
		
		return "/admin/orderList";
	}
	
	// 주문 상세 페이지
	@GetMapping({ "/orderInfo"})
	public String orderInfoGET(String orderId, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		log.info("orderInfoGET..." + orderId);

		// 페이지 정보
//		model.addAttribute("cri" + cri);

		// 선택 작가 정보
		model.addAttribute("orderInfo", adminService.gerOrderInfo(orderId));
		
		return "/admin/orderInfo";

	}
	
	// 주문삭제
	@PostMapping("/orderCancle")
	public String orderCanclePOST(OrderDTO od ,OrderCancleDTO dto, HttpServletRequest request) {
		
		orderService.orderCancle(dto);
		
		// 삭제 후 충전금액, 포인트 갱신
		MemberVO member = new MemberVO();
		member.setMemberId(od.getMemberId());
		
		HttpSession session = request.getSession();
		
		try {
			MemberVO memberLogin = memberService.memberLogin(member);
			memberLogin.setMemberPw("");
			session.setAttribute("member", memberLogin);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/admin/orderList?keyword=" + dto.getKeyword() + "&amount=" + dto.getAmount() + "&pageNum=" + dto.getPageNum();
	}
	
	// 회원 리스트
	@GetMapping("/memberManage")
	public String memberListGET(@ModelAttribute("cri") Criteria cri, Model model) {
		List<MemberVO> list = adminService.getMemberList(cri);
		
		if(!list.isEmpty()) {
			model.addAttribute("list", list);
			model.addAttribute("pageMaker", new PageDTO(cri, adminService.getMemberTotal(cri)));
		} else {
			model.addAttribute("listCheck", "empty");
		}
		
		return "/admin/memberManage";
	}
	
	// 회원 상세 페이지
	@GetMapping("/memberDetail")
	public void memberDetailGET(String memberId, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("memberDetailGET.." + memberId);
		
		model.addAttribute("memberInfo", adminService.memberDetail(memberId));
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
