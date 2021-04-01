package com.race.site;

import java.util.List;

import com.race.utility.ApiResponse;

import lombok.Builder;

public class SiteResponse extends ApiResponse<SiteVO>	{

	@Builder
	public SiteResponse(final SiteVO vo, final List<String> errors) {
		super(vo);
		this.setErrors(errors);
	}

}
