<%@ include file="taglibs.jsp" %>
<div class="panel panel-default">
                        <div class="panel-heading">
                          Weather Observation
                        </div>
                        <div class="panel-body">
                        
                        <%@ include file="alert.jsp"%>
                        
                        <div class="list-group">
                                <span class="list-group-item">
                                   <span class="text-muted small"><em>Station Name</em></span>
                                    <span class="pull-right">  ${sessionScope.wobserv.stationName}- ${sessionScope.wobserv.countryCode}
                                    
                                    
                                    </span>
                                </span>
                                
                                 <span class="list-group-item">
                                   <span class="text-muted small"><em>Weather Condition</em></span>
                                    <span class="pull-right">${sessionScope.wobserv.weatherCondition}
                                    </span>
                                </span>
                                
                                  <span class="list-group-item">
                                   <span class="text-muted small"><em>Temperature</em></span>
                                    <span class="pull-right"> ${sessionScope.wobserv.temperature} Degrees
                                    </span>
                                </span>
                                
                                   <span class="list-group-item">
                                   <span class="text-muted small"><em>Humidity</em></span>
                                    <span class="pull-right"> ${sessionScope.wobserv.humidity}
                                    </span>
                                </span>
                                 <span class="list-group-item">
                                   <span class="text-muted small"><em>Dew Point</em></span>
                                    <span class="pull-right"> ${sessionScope.wobserv.dewPoint}
                                    </span>
                                </span>
                                
                                <span class="list-group-item">
                                   <span class="text-muted small"><em>Clouds</em></span>
                                    <span class="pull-right">${sessionScope.wobserv.clouds}
                                    </span>
                                </span>
                                
                                  <span class="list-group-item">
                                   <span class="text-muted small"><em>Date</em></span>
                                    <span class="pull-right">${sessionScope.wobserv.datetime}
                                   
                                    </span>
                                </span>
                                
                            </div>
                        
                        </div></div>