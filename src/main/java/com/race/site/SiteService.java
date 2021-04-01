package com.race.site;

import java.util.List;

public interface SiteService {

	List<SiteVO> list_seqno_asc(int sitegrpno);

	int create(SiteVO vo);
	
}
