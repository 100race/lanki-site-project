package com.race.site;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.race.site.SiteServiceImpl")
public class SiteServiceImpl implements SiteService {
	
	@Autowired
	private SiteMapper mapper;

	@Override
	public List<SiteVO> list_seqno_asc(int sitegrpno) {
		return mapper.list_seqno_asc(sitegrpno);
	}

	@Override
	public int create(SiteVO vo) {
		return mapper.create(vo);
	}

}
