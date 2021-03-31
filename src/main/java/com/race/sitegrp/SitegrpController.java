package com.race.sitegrp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;



@RestController
//@RequestMapping("/test")
public class SitegrpController {
	
//	@Autowired
//	@Qualifier("com.race.site.siteServiceImpl")
//	private CateService service;

	@Autowired
	@Qualifier("com.race.sitegrp.SitegrpServiceImpl")
	private SitegrpService gservice;

	public SitegrpController() {
		System.out.println("--> SitegrpController created.");
	}		
	

	//홈화면에 데이터불러온다
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public @ResponseBody List<SitegrpResponse> getlist(){
		
		List<String> errors = new ArrayList<>();
		
		List<SitegrpVO> sitegrplist = null;
		
		List<SitegrpResponse> sitegrpResponses = new ArrayList<>();
		
		try {
			
			sitegrplist = gservice.list_seqno_asc();

		}catch(final Exception e) { // 에러메시지 저장
			
			errors.add(e.getMessage());
		}
		
		sitegrplist.stream().forEach(vo ->{
			
			sitegrpResponses.add(SitegrpAdapter.sitegrpResponse(vo, errors));
			
		});

		return sitegrpResponses;
	}
	
	
	//새 사이트그룹을 만들다
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public  ResponseEntity<String> create(@RequestParam("") SitegrpVO vo){
		ModelAndView mav = new ModelAndView();

		int cnt = gservice.create(vo);
		mav.addObject("cnt", cnt);
		mav.addObject("categrpno", vo.getSitegrpno());
		mav.addObject("url", "/cate/create_msg");

		mav.setViewName("redirect:/cate/msg");

		
		return ResponseEntity.ok(null);
	}
	
}
