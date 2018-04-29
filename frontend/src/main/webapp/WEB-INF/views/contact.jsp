<div class="container">
	<div class="row">

		<h2>Google Maps Tulip</h2>
		<hr />

		<!DOCTYPE html>
		<html>
<head>
<style>
#map {
	height: 400px;
	width: 100%;
}
</style>
</head>
<body>
	<hr />
	<h3></h3>
	<div id="map">
		<script>
			function initMap() {
				var uluru = {
					lat : 47.396268,
					lng : 28.815012
				};
				var map = new google.maps.Map(document.getElementById('map'), {
					zoom : 19,
					center : uluru
				});
				var marker = new google.maps.Marker({
					position : uluru,
					map : map
				});
			}
		</script>

	</div>

	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD2J_YvR7xDP314RMHsZHRvOO13OHyg1o0&callback=initMap">
		
	</script>
</body>
		</html>


	</div>
	<!-- 	  <div class="row">
		  <pre> 
		   <p> Contact: </p>
		     <h5> Mobile Phone:</h5> 068272361 </hr>
		     <h4> Street:  </h4>str.Constantin Negruzii 103
		     <h4>Email</h4> 
              </pre>
         </div>  -->

	<ul class="list-group">
		<li class="list-group-item list-group-item-info"><h5>Contacts:</h5></li>
		<li class="list-group-item"><h5> Mobile Phone: </h5> <h6>068272361</h6> </li>
		<li class="list-group-item"> <h5> Street:</h5><h6>str.Constantin Negruzii 103</h6></li>
		<li class="list-group-item"><h5>Email:</h5><h6>cafetulip@gmail.com</h6></li>
		
	</ul>

</div>






