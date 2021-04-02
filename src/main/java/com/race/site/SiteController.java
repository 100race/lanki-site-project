package com.race.site;

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
@RequestMapping("/api/site")
public class SiteController {
	
	@Autowired
	@Qualifier("com.race.site.SiteServiceImpl")
	private SiteService service; 
	
	public SiteController() {
		System.out.println("--> SiteController created.");
	}	
	
		//read화면에 데이터불러온다
		@RequestMapping(value = "/read", method = RequestMethod.GET)
		public @ResponseBody List<SiteResponse> getlist(@RequestParam(value="sitegrpno", defaultValue="0") int sitegrpno){
			//url요청으로 vue.js에서 보내준 데이터를 받아옴
			List<String> errors = new ArrayList<>();
			
			List<SiteVO> sitelist = null;
			
			List<SiteResponse> siteResponses = new ArrayList<>();
			
			try {
				
				sitelist = service.list_seqno_asc(sitegrpno);

			}catch(final Exception e) { // 에러메시지 저장
				
				errors.add(e.getMessage());
			}
			
			sitelist.stream().forEach(vo ->{
				
				siteResponses.add(SiteAdapter.siteResponse(vo, errors));
				
			});

			return siteResponses;
		}
		
		
//		//새 사이트그룹을 만들다
//		@RequestMapping(value = "/create", method = RequestMethod.POST)
//		public  ResponseEntity<String> create(@RequestParam("") SiteVO vo){
//			ModelAndView mav = new ModelAndView();
//
//			int cnt = service.create(vo);
//			mav.addObject("cnt", cnt);
//			mav.addObject("categrpno", vo.getSitegrpno());
//			mav.addObject("url", "/cate/create_msg");
//
//			mav.setViewName("redirect:/cate/msg");
//
//			
//			return ResponseEntity.ok(null);
//		}
	
}
