package com.race.sitegrp;

import java.util.List;


public interface SitegrpService {

	List<SitegrpVO> list_seqno_asc();

	int create(SitegrpVO vo);
	
}
