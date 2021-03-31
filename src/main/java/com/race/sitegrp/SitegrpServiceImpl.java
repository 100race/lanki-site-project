package com.race.sitegrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("com.race.sitegrp.SitegrpServiceImpl")
public class SitegrpServiceImpl implements SitegrpService {

	@Autowired
	private SitegrpMapper mapper;
	
	@Override
	public List<SitegrpVO> list_seqno_asc() {
		return mapper.list_seqno_asc();
	}
	
	@Override
	public int create(SitegrpVO vo) {
		return mapper.create(vo);
	}

}
