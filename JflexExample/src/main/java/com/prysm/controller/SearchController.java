package com.prysm.controller;

import java.io.IOException;

import org.jflex.example.JFlexExample;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.prysm.models.Result;

@RestController
public class SearchController {
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public Result getResult(@RequestParam(value = "query") String query) throws IOException {
		Result result = new Result();
		result.setQuery(query);
		String url = JFlexExample.getUrl( (" " + query).toLowerCase());
		result.setResponse(url);
		return result;
	}
}
