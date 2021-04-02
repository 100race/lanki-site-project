package com.race.sitegrp;

import java.util.List;

public interface SitegrpMapper {

	List<SitegrpVO> list_seqno_asc();

	SitegrpVO get(int sitegrpno);
	
	int create(SitegrpVO vo);

}
