function Point(a, b) {
	this.x = a;
	this.y = b;
}

Point.prototype.quadrant = function() {
	var result = "n/a";
	if (this.x > 0 && this.y > 0)
		result = "I";
	else if (this.x < 0 && this.y > 0)
		result = "II";
	else if (this.x < 0 && this.y < 0)
		result = "III";
	else if (this.x > 0 && this.y < 0)
		result = "IV";
	else
		result = "Origin";
	return result;	
}

function fib(n) {
	var result = 1;
	if (n > 2) {
		result = fib(n-1) + fib(n-2);
	}
	return result;
}

function quad(pt) {
	var result = "n/a";
	if (pt) {
		result = fib(n-1) + fib(n-2);
	}
	return result;
}

print("Example");
print(fib(7));
print(Math.random());
var d = new Date();
print(d);
print(d.getYear());
d = new Point(4,-2);
print(d.quadrant());
