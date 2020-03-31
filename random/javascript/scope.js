var x = "main:X";
var y = "main:Y";
var z = "main:Z";

function f() {
	function g() {
		print("In G: " + x + " " + y + " " + z);
	}
	function h() {
		function i() {
			var x = "i:X";
			print("In I: " + x + " " + y + " " + z);
		}
		var z = "h:z";
		print("In H: " + x + " " + y + " " + z);
		g();
		i();
	}
	var x="f:X";
	var y = "f:Y";
	print("In F: " + x + " " + y + " " + z);
	g();
	h();
}

print("Scoping in Javascript");
f();
print("In main: " + x + " " + y + " " + z);
