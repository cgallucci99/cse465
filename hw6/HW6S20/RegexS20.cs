using System;

public class RegexS20 {
	public static bool isLongPhoneNumber(String str) {
		return false;
	}
	public static bool isLongPhoneNumber2(String str) {
		return false;
	}
	public static bool isRealLiteralPart1(String str) {
		return false;
	}
	public static bool isEmailAddress(String str) {
		return false;
	}
	public static void Main(String [] args) {
		Console.WriteLine(isLongPhoneNumber("513-529-1809"));		// true
		Console.WriteLine(isLongPhoneNumber(" 513-529-1809 "));	// false
		Console.WriteLine(isLongPhoneNumber("513 529 1809"));		// false
		Console.WriteLine(isLongPhoneNumber("013-529-1809"));		// true

		Console.WriteLine(isLongPhoneNumber2("513-529-1809"));		// true
		Console.WriteLine(isLongPhoneNumber2("513-029-1809"));		// false
		Console.WriteLine(isLongPhoneNumber2("013-529-1809"));		// false
		Console.WriteLine(isLongPhoneNumber2("013-029-1809"));		// false
		
		Console.WriteLine(isRealLiteralPart1("12.0"));				// true		
		Console.WriteLine(isRealLiteralPart1("0.0E-12"));			// true		
		Console.WriteLine(isRealLiteralPart1(".-12"));				// false

		Console.WriteLine(isEmailAddress("johndoe@domainsample.com"));		// true		
		Console.WriteLine(isEmailAddress("john.doe@domainsample.net"));	// true		
		Console.WriteLine(isEmailAddress("john.doe43@domainsample.co.uk"));// true		
		Console.WriteLine(isEmailAddress("@domainsample.com"));		// false		
		Console.WriteLine(isEmailAddress("johndoedomainsample.com"));	// false		
		Console.WriteLine(isEmailAddress("john.doe@.net"));			// false		
		Console.WriteLine(isEmailAddress("john.doe43@domainsample"));	// false		
	}
}
