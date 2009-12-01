function newHighlight(state){

// grabs the state (mousedown is 'no highlight or 0' and mouseup is 'turn highlight
// back on- 1') and resets the background color of the TRs (all TRs in table) to 
// white, or peach. Iterates through rows because we have dynamically written Ids in 
// Radiant.

	var myTrArray = $$('tr');
	myTrArray.each(function(i) {
		if(i.id != ''){
			if(state == '0'){
				$(i.id).setStyle({ backgroundColor: '#ffffff'});
			} else {
					$(i.id).setStyle({ backgroundColor: '#ffffb3'});
			}
		}	
	});
	
}
