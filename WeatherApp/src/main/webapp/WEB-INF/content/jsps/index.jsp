<%@ include file="taglibs.jsp" %>

<!DOCTYPE html>

<html lang="en">
<head>
  <sj:head compressed="true"/>

<title><fmt:message key="webapp.name"/></title>

<%@ include file="meta.jsp" %>


</head>
<body>

<div class="wrapper">

<nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
        <div class="container topnav">
  
            <div class="navbar-header">
               
                <a class="navbar-brand topnav" href="#"><fmt:message key="webapp.name"/></a>
            </div>
            
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    
    <div class="container" style="margin-top: 70px;">
    
    
    <div class="row">
<s:form id="weatherAppForm" cssClass="" action="load-weather" method="post">

			
			
				<div class="col-lg-8">
				
						<h2>Location Map</h2>
						<hr>
		    
						
						<div id="mapDiv">
						        <div id="noGeo"></div>
								<div id="mapCanvas" style="width:100%; height:300px;"></div>
							</div>
							<div>
							
							
								
						 <h5><b>NOTE: </b>Drag the marker to your choice location for new geolocation and click submit to view results on the right hand panel</h5>
                          <hr>
              <sj:submit value="submit" indicator="webobindicator" targets="weatherObservationDiv" cssClass="btn-success btn-lg btn-block form-contro" formIds="weatherAppForm" />
								
			<img id="webobindicator" style="position: absolute; top: 50%; left: 50%; display:none;" src="./img/indicator.gif" alt="Processing..." />	
		    <br>
		    <label>Longitude</label>
			 <s:textfield readonly="true" name="lat" cssClass="form-control"/>
								<br>
								
								<label>Latitude</label>
								<s:textfield readonly="true" name="lon" cssClass="form-control"/>
								<br>
      
              
            
			
							</div>
								
				
					
				</div>
		
		<div class="col-lg-4">
		<div id="weatherObservationDiv">
						
				   <s:include value="weatherObservationDiv.jsp"></s:include>
							</div>	 		
							</div>
					
			
</s:form>
</div>
     
    </div>
    
    </div>
    
     <script type="text/javascript">
     
     window.setTimeout(function() {
    	    $(".alert-message").fadeTo(500, 0).slideUp(500, function(){
    	        $(this).remove(); 
    	    });
    	}, 5000);
     
            $(document).ready(function() {
            	
            	
            	/* check if browser supports geolocation */
            	
                if(!!navigator.geolocation) {
                	
                	
                	
                	  navigator.geolocation.getCurrentPosition(showCurrentLocation);
                	
                	  
                	  function showCurrentLocation(position)
                      {
                          var latitude = position.coords.latitude;
                          var longitude = position.coords.longitude;
                          var coords = new google.maps.LatLng(latitude, longitude);
                          
                          
                          document.getElementById('weatherAppForm_lat').value = latitude;
             		      document.getElementById('weatherAppForm_lon').value = longitude;
             		      
             		     $('#weatherObservationDiv').load('load-weather.action?lat='+latitude+'&lon='+longitude);

                          var mapOptions = {
                          zoom: 15,
                          center: coords,
                          mapTypeControl: true,
                          mapTypeId: google.maps.MapTypeId.ROADMAP
                      };
                          
                          map = new google.maps.Map(document.getElementById('mapCanvas'), mapOptions);
                          
                          
                          var marker = new google.maps.Marker({
                     	        position: coords, 
                     	        map: map,
                     	        draggable:true
                     	    });
                          
                          google.maps.event.addListener(
                        		    marker,
                        		    'drag',
                        		    function() {
                        		        document.getElementById('weatherAppForm_lat').value = marker.position.lat();
                        		        document.getElementById('weatherAppForm_lon').value = marker.position.lng();
                        		    }
                        		);
                      	
                          
                      }
             
                    
                } else {
                	
                	document.getElementById('noGeo').innerHTML = '<div class="alert alert-warning">Default location set because your browser does not support Geolocation</div';
                	
                	//return a default value or session value
                		 
              	      var latitude = <s:text name="lat"/>;			
            		  var longitude = <s:text name="lon"/>;
            		  
            		document.getElementById('weatherAppForm_lat').value = latitude;
      		        document.getElementById('weatherAppForm_lon').value = longitude;
      		        
      		      $('#weatherObservationDiv').load('load-weather.action?lat='+latitude+'&lon='+longitude);
              	
              	    var myLatlng = new google.maps.LatLng(latitude,longitude);
              	 
              	    var myOptions = {
              	      zoom: 10,
              	      center: myLatlng,
              	      mapTypeId: google.maps.MapTypeId.ROADMAP
              	    }
              	    
              	    var map = new google.maps.Map(document.getElementById("mapCanvas"), myOptions);
              	    
              	  
            	    var marker = new google.maps.Marker({
            	        position: myLatlng, 
            	        map: map,
            	        draggable:true
            	    });
            	
            
            	
            	   google.maps.event.addListener(
               		    marker,
               		    'drag',
               		    function() {
               		        document.getElementById('weatherAppForm_lat').value = marker.position.lat();
               		        document.getElementById('weatherAppForm_lon').value = marker.position.lng();
               		    }
               		);
                   
                }
            	
  
            	
            });
			
		</script>
    </body>

</html>