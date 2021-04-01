package com.race.site;

import java.util.List;

public class SiteAdapter {

public static SiteResponse siteResponse(final SiteVO vo, final List<String> errors ) {
		
		return SiteResponse.builder().vo(vo).errors(errors).build();
	}


}
