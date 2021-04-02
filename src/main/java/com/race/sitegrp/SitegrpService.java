package com.race.sitegrp;

import java.util.List;


public interface SitegrpService {

	List<SitegrpVO> list_seqno_asc();
	
	SitegrpVO get(int sitegrpno);

	int create(SitegrpVO vo);
	
}
