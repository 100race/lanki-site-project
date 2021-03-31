package com.race.sitegrp;

import java.util.List;

public class SitegrpAdapter {
	
	public static SitegrpResponse sitegrpResponse(final SitegrpVO vo, final List<String> errors ) {
		
		return SitegrpResponse.builder().vo(vo).errors(errors).build();
	}
}
