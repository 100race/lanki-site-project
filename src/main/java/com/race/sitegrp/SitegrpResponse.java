package com.race.sitegrp;

import java.util.List;

import com.race.utility.ApiResponse;

import lombok.Builder;

public class SitegrpResponse extends ApiResponse<SitegrpVO>	{

	@Builder
	public SitegrpResponse(final SitegrpVO vo, final List<String> errors) {
		super(vo);
		this.setErrors(errors);
	}

}
