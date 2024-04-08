function randommail(args) {
	var chars = 'ABCDEFabcdefghijklms';
	var n = args.number;
	for(i=0; i<= n; i++) { 
	var  randomdata = chars.charAt(Math.floor(Math.random(100) * chars.length()));
	var data = randomdata + '@gmail.com';
	}
	return data;
}