/**
 *
 */
package com.prognostore.weatherapp.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import org.apache.log4j.Logger;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.prognostore.weatherapp.model.WeatherOb;

/**
 * Service class for retrieving data from geonames webservice 
 * 
 * @author Adebayo Adeniyan
 *
 */


public class GeonamesWeatherServiceClient {
	
	static final String GEO_USERNAME = "prognotest";
	static Logger appLog = Logger.getLogger(GeonamesWeatherServiceClient.class);
	
	
	
	public static WeatherOb findNearByWeatherByGeolocation(Double longitude, Double latitude){
		
		try {
				
			URL url = new URL("http://api.geonames.org/findNearByWeatherJSON?format=JSON&lat="+String.valueOf(latitude)+"&lng="+String.valueOf(longitude)+"&username="+GEO_USERNAME+"&s");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			conn.setRequestMethod("GET");
			
			InputStreamReader isr = new InputStreamReader(conn.getInputStream());
			BufferedReader br = new BufferedReader(isr);
			
			String output;
			StringBuffer buffer = new StringBuffer();
			
			while((output = br.readLine())!=null){
				
				buffer.append(output);
				
			}

			Gson gson = new GsonBuilder().create();
			
			JsonObject job = gson.fromJson(buffer.toString(), JsonObject.class);
			
			
			
			
			if(job.getAsJsonObject().has("weatherObservation")){
				
				
				JsonObject weatherObJson = job.getAsJsonObject("weatherObservation");
				
				
				return generateObjfromJsonObj(weatherObJson);
				
			}
	
	
			
		} catch (MalformedURLException e) {
			
			appLog.error("MalformedURLException: "+e);
			
		} catch (IOException e) {
			appLog.error("IOException: "+e);
			
		}
		
		return null;
		
		
	}
	
	
	public static WeatherOb generateObjfromJsonObj(JsonObject jso){
		
		WeatherOb wob = new WeatherOb();
		
		wob.setClouds(jso.get(GeoElementConstants.clouds).getAsString());
		wob.setCloudsCode(jso.get(GeoElementConstants.cloudsCode).getAsString());
		wob.setCountryCode(jso.get(GeoElementConstants.countryCode).getAsString());
		wob.setDatetime(jso.get(GeoElementConstants.datetime).getAsString());
		wob.setDewPoint(jso.get(GeoElementConstants.dewPoint).getAsString());
		wob.setElevation(jso.get(GeoElementConstants.elevation).getAsString());
		wob.setHectoPascAltimeter(jso.get(GeoElementConstants.hectoPascAltimeter).getAsString());
		wob.setHumidity(jso.get(GeoElementConstants.humidity).getAsString());
		wob.setICAO(jso.get(GeoElementConstants.ICAO).getAsString());
		wob.setObservation(jso.get(GeoElementConstants.observation).getAsString());
		wob.setStationName(jso.get(GeoElementConstants.stationName).getAsString());
		wob.setTemperature(jso.get(GeoElementConstants.temperature).getAsString());
		wob.setWeatherCondition(jso.get(GeoElementConstants.weatherCondition).getAsString());
		wob.setWindDirection(jso.get(GeoElementConstants.windDirection).getAsString());
		wob.setWindSpeed(jso.get(GeoElementConstants.windSpeed).getAsString());
		wob.setLng(jso.get(GeoElementConstants.lng).getAsString());
		wob.setLat(jso.get(GeoElementConstants.lat).getAsString());
		
		
		return wob;
	}
	

}
